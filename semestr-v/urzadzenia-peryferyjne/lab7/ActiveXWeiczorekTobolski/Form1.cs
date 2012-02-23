using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Threading;
using System.Collections;
using System.IO;


namespace ActiveXWeiczorekTobolski
{
	public partial class Form1 : Form
	{
		[DllImport("WinMM.dll")]
		public static extern bool PlaySound(string fname, int Mod, int flag);

		public Form1()
		{
			InitializeComponent();
			axWindowsMediaPlayer1.URL = @"I:\\up\\sample.wav";
		}

		private void button1_Click(object sender, EventArgs e)
		{
			PlaySound("i:\\up\\sample.wav", SND_FILENAME , SND_ASYNC);
		}

		public int SND_ASYNC = 0x0001;     // play asynchronously
		public int SND_FILENAME = 0x00020000; // use file name
		public int SND_PURGE = 0x0040;     // purge non-static events

		public void Play(string fname, int SoundFlags)
		{
			PlaySound(fname, 0, SoundFlags);
		}

		public void StopPlay()
		{
			PlaySound(null, 0, SND_PURGE);
		}

		private void axWindowsMediaPlayer1_Enter(object sender, EventArgs e)
		{

		}
		WaveOutPlayer m_Player;
		private byte[] m_PlayBuffer;
		private byte[] m_RecBuffer;
		private FifoStream m_Fifo = new FifoStream();

		private void waveForm_Click(object sender, EventArgs e)
		{
			WaveFormat fmt = new WaveFormat(44100, 16, 2);
			m_Player = new WaveOutPlayer(-1, fmt, 16384, 3,
						new BufferFillEventHandler(Filler));
		}

		private void Filler(IntPtr data, int size)
		{
			if (m_PlayBuffer == null || m_PlayBuffer.Length < size)
				m_PlayBuffer = new byte[size];
			if (m_Fifo.Length >= size)
				m_Fifo.Read(m_PlayBuffer, 0, size);
			else
				for (int i = 0; i < m_PlayBuffer.Length; i++)
					m_PlayBuffer[i] = 0;
			System.Runtime.InteropServices.Marshal.Copy(m_PlayBuffer,
														 0, data, size);
		}

		

		private void button2_Click(object sender, EventArgs e)
		{
			DialogResult result = openFileDialog1.ShowDialog();
			if (result == DialogResult.OK) // Test result.
			{
				axWindowsMediaPlayer2.URL = @openFileDialog1.FileName;
				if (axWindowsMediaPlayer2.playState == WMPLib.WMPPlayState.wmppsStopped)
				{
					axWindowsMediaPlayer2.Ctlcontrols.play();
				}
			}
		}

		[DllImport("winmm.dll", EntryPoint = "mciSendStringA", CharSet = CharSet.Ansi, SetLastError = true, ExactSpelling = true)]
		private static extern int mciSendString(string lpstrCommand, string lpstrReturnString, int uReturnLength, int hwndCallback);


		private void button3_Click(object sender, EventArgs e)
		{
			mciSendString("open new Type waveaudio Alias recsound", "", 0, 0);
			mciSendString("record recsound", "", 0, 0);
		}

		private void button4_Click(object sender, EventArgs e)
		{
			mciSendString("save recsound i:\\up\\result.wav", "", 0, 0);
			mciSendString("close recsound ", "", 0, 0);
		}



	}



	internal class WaveOutHelper
	{
		public static void Try(int err)
		{
			if (err != WaveNative.MMSYSERR_NOERROR)
				throw new Exception(err.ToString());
		}
	}

	public delegate void BufferFillEventHandler(IntPtr data, int size);

	internal class WaveOutBuffer : IDisposable
	{
		public WaveOutBuffer NextBuffer;

		private AutoResetEvent m_PlayEvent = new AutoResetEvent(false);
		private IntPtr m_WaveOut;

		private WaveNative.WaveHdr m_Header;
		private byte[] m_HeaderData;
		private GCHandle m_HeaderHandle;
		private GCHandle m_HeaderDataHandle;

		private bool m_Playing;

		internal static void WaveOutProc(IntPtr hdrvr, int uMsg, int dwUser, ref WaveNative.WaveHdr wavhdr, int dwParam2)
		{
			if (uMsg == WaveNative.MM_WOM_DONE)
			{
				try
				{
					GCHandle h = (GCHandle)wavhdr.dwUser;
					WaveOutBuffer buf = (WaveOutBuffer)h.Target;
					buf.OnCompleted();
				}
				catch
				{
				}
			}
		}

		public WaveOutBuffer(IntPtr waveOutHandle, int size)
		{
			m_WaveOut = waveOutHandle;

			m_HeaderHandle = GCHandle.Alloc(m_Header, GCHandleType.Pinned);
			m_Header.dwUser = (IntPtr)GCHandle.Alloc(this);
			m_HeaderData = new byte[size];
			m_HeaderDataHandle = GCHandle.Alloc(m_HeaderData, GCHandleType.Pinned);
			m_Header.lpData = m_HeaderDataHandle.AddrOfPinnedObject();
			m_Header.dwBufferLength = size;
			WaveOutHelper.Try(WaveNative.waveOutPrepareHeader(m_WaveOut, ref m_Header, Marshal.SizeOf(m_Header)));
		}
		~WaveOutBuffer()
		{
			Dispose();
		}
		public void Dispose()
		{
			if (m_Header.lpData != IntPtr.Zero)
			{
				WaveNative.waveOutUnprepareHeader(m_WaveOut, ref m_Header, Marshal.SizeOf(m_Header));
				m_HeaderHandle.Free();
				m_Header.lpData = IntPtr.Zero;
			}
			m_PlayEvent.Close();
			if (m_HeaderDataHandle.IsAllocated)
				m_HeaderDataHandle.Free();
			GC.SuppressFinalize(this);
		}

		public int Size
		{
			get { return m_Header.dwBufferLength; }
		}

		public IntPtr Data
		{
			get { return m_Header.lpData; }
		}

		public bool Play()
		{
			lock (this)
			{
				m_PlayEvent.Reset();
				m_Playing = WaveNative.waveOutWrite(m_WaveOut, ref m_Header, Marshal.SizeOf(m_Header)) == WaveNative.MMSYSERR_NOERROR;
				return m_Playing;
			}
		}
		public void WaitFor()
		{
			if (m_Playing)
			{
				m_Playing = m_PlayEvent.WaitOne();
			}
			else
			{
				Thread.Sleep(0);
			}
		}
		public void OnCompleted()
		{
			m_PlayEvent.Set();
			m_Playing = false;
		}
	}

	public class WaveOutPlayer : IDisposable
	{
		private IntPtr m_WaveOut;
		private WaveOutBuffer m_Buffers; // linked list
		private WaveOutBuffer m_CurrentBuffer;
		private Thread m_Thread;
		private BufferFillEventHandler m_FillProc;
		private bool m_Finished;
		private byte m_zero;

		private WaveNative.WaveDelegate m_BufferProc = new WaveNative.WaveDelegate(WaveOutBuffer.WaveOutProc);

		public static int DeviceCount
		{
			get { return WaveNative.waveOutGetNumDevs(); }
		}

		public WaveOutPlayer(int device, WaveFormat format, int bufferSize, int bufferCount, BufferFillEventHandler fillProc)
		{
			m_zero = format.wBitsPerSample == 8 ? (byte)128 : (byte)0;
			m_FillProc = fillProc;
			WaveOutHelper.Try(WaveNative.waveOutOpen(out m_WaveOut, device, format, m_BufferProc, 0, WaveNative.CALLBACK_FUNCTION));
			AllocateBuffers(bufferSize, bufferCount);
			m_Thread = new Thread(new ThreadStart(ThreadProc));
			m_Thread.Start();
		}
		~WaveOutPlayer()
		{
			Dispose();
		}
		public void Dispose()
		{
			if (m_Thread != null)
				try
				{
					m_Finished = true;
					if (m_WaveOut != IntPtr.Zero)
						WaveNative.waveOutReset(m_WaveOut);
					m_Thread.Join();
					m_FillProc = null;
					FreeBuffers();
					if (m_WaveOut != IntPtr.Zero)
						WaveNative.waveOutClose(m_WaveOut);
				}
				finally
				{
					m_Thread = null;
					m_WaveOut = IntPtr.Zero;
				}
			GC.SuppressFinalize(this);
		}
		private void ThreadProc()
		{
			while (!m_Finished)
			{
				Advance();
				if (m_FillProc != null && !m_Finished)
					m_FillProc(m_CurrentBuffer.Data, m_CurrentBuffer.Size);
				else
				{
					// zero out buffer
					byte v = m_zero;
					byte[] b = new byte[m_CurrentBuffer.Size];
					for (int i = 0; i < b.Length; i++)
						b[i] = v;
					Marshal.Copy(b, 0, m_CurrentBuffer.Data, b.Length);

				}
				m_CurrentBuffer.Play();
			}
			WaitForAllBuffers();
		}
		private void AllocateBuffers(int bufferSize, int bufferCount)
		{
			FreeBuffers();
			if (bufferCount > 0)
			{
				m_Buffers = new WaveOutBuffer(m_WaveOut, bufferSize);
				WaveOutBuffer Prev = m_Buffers;
				try
				{
					for (int i = 1; i < bufferCount; i++)
					{
						WaveOutBuffer Buf = new WaveOutBuffer(m_WaveOut, bufferSize);
						Prev.NextBuffer = Buf;
						Prev = Buf;
					}
				}
				finally
				{
					Prev.NextBuffer = m_Buffers;
				}
			}
		}
		private void FreeBuffers()
		{
			m_CurrentBuffer = null;
			if (m_Buffers != null)
			{
				WaveOutBuffer First = m_Buffers;
				m_Buffers = null;

				WaveOutBuffer Current = First;
				do
				{
					WaveOutBuffer Next = Current.NextBuffer;
					Current.Dispose();
					Current = Next;
				} while (Current != First);
			}
		}
		private void Advance()
		{
			m_CurrentBuffer = m_CurrentBuffer == null ? m_Buffers : m_CurrentBuffer.NextBuffer;
			m_CurrentBuffer.WaitFor();
		}
		private void WaitForAllBuffers()
		{
			WaveOutBuffer Buf = m_Buffers;
			while (Buf.NextBuffer != m_Buffers)
			{
				Buf.WaitFor();
				Buf = Buf.NextBuffer;
			}
		}
	}

	public class FifoStream : Stream
	{
		private const int BlockSize = 65536;
		private const int MaxBlocksInCache = (3 * 1024 * 1024) / BlockSize;

		private int m_Size;
		private int m_RPos;
		private int m_WPos;
		private Stack m_UsedBlocks = new Stack();
		private ArrayList m_Blocks = new ArrayList();

		private byte[] AllocBlock()
		{
			byte[] Result = null;
			Result = m_UsedBlocks.Count > 0 ? (byte[])m_UsedBlocks.Pop() : new byte[BlockSize];
			return Result;
		}
		private void FreeBlock(byte[] block)
		{
			if (m_UsedBlocks.Count < MaxBlocksInCache)
				m_UsedBlocks.Push(block);
		}
		private byte[] GetWBlock()
		{
			byte[] Result = null;
			if (m_WPos < BlockSize && m_Blocks.Count > 0)
				Result = (byte[])m_Blocks[m_Blocks.Count - 1];
			else
			{
				Result = AllocBlock();
				m_Blocks.Add(Result);
				m_WPos = 0;
			}
			return Result;
		}

		// Stream members
		public override bool CanRead
		{
			get { return true; }
		}
		public override bool CanSeek
		{
			get { return false; }
		}
		public override bool CanWrite
		{
			get { return true; }
		}
		public override long Length
		{
			get
			{
				lock (this)
					return m_Size;
			}
		}
		public override long Position
		{
			get { throw new InvalidOperationException(); }
			set { throw new InvalidOperationException(); }
		}
		public override void Close()
		{
			Flush();
		}
		public override void Flush()
		{
			lock (this)
			{
				foreach (byte[] block in m_Blocks)
					FreeBlock(block);
				m_Blocks.Clear();
				m_RPos = 0;
				m_WPos = 0;
				m_Size = 0;
			}
		}
		public override void SetLength(long len)
		{
			throw new InvalidOperationException();
		}
		public override long Seek(long pos, SeekOrigin o)
		{
			throw new InvalidOperationException();
		}
		public override int Read(byte[] buf, int ofs, int count)
		{
			lock (this)
			{
				int Result = Peek(buf, ofs, count);
				Advance(Result);
				return Result;
			}
		}
		public override void Write(byte[] buf, int ofs, int count)
		{
			lock (this)
			{
				int Left = count;
				while (Left > 0)
				{
					int ToWrite = Math.Min(BlockSize - m_WPos, Left);
					Array.Copy(buf, ofs + count - Left, GetWBlock(), m_WPos, ToWrite);
					m_WPos += ToWrite;
					Left -= ToWrite;
				}
				m_Size += count;
			}
		}

		// extra stuff
		public int Advance(int count)
		{
			lock (this)
			{
				int SizeLeft = count;
				while (SizeLeft > 0 && m_Size > 0)
				{
					if (m_RPos == BlockSize)
					{
						m_RPos = 0;
						FreeBlock((byte[])m_Blocks[0]);
						m_Blocks.RemoveAt(0);
					}
					int ToFeed = m_Blocks.Count == 1 ? Math.Min(m_WPos - m_RPos, SizeLeft) : Math.Min(BlockSize - m_RPos, SizeLeft);
					m_RPos += ToFeed;
					SizeLeft -= ToFeed;
					m_Size -= ToFeed;
				}
				return count - SizeLeft;
			}
		}
		public int Peek(byte[] buf, int ofs, int count)
		{
			lock (this)
			{
				int SizeLeft = count;
				int TempBlockPos = m_RPos;
				int TempSize = m_Size;

				int CurrentBlock = 0;
				while (SizeLeft > 0 && TempSize > 0)
				{
					if (TempBlockPos == BlockSize)
					{
						TempBlockPos = 0;
						CurrentBlock++;
					}
					int Upper = CurrentBlock < m_Blocks.Count - 1 ? BlockSize : m_WPos;
					int ToFeed = Math.Min(Upper - TempBlockPos, SizeLeft);
					Array.Copy((byte[])m_Blocks[CurrentBlock], TempBlockPos, buf, ofs + count - SizeLeft, ToFeed);
					SizeLeft -= ToFeed;
					TempBlockPos += ToFeed;
					TempSize -= ToFeed;
				}
				return count - SizeLeft;
			}
		}
	}
}
