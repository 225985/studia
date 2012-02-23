using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using Microsoft.DirectX;
using Microsoft.DirectX.DirectSound;
//using DS = Microsoft.DirectX.DirectSound;

namespace MuzykaWieczorekTobolski
{
	public partial class Form1 : Form
	{
		private DevicesCollection devList;
		private Device dSound;
		private BufferDescription d;
		private SecondaryBuffer sound;

		private int len;
		private bool playing = false;
		private string currFile = @"C:\Users\lab\Music\sample.wav";

		public Form1()
		{
			InitializeComponent();
			//devList = new DevicesCollection();
			// Populate cmbAudioCards
			

			// Create Device
			dSound = new Device();//devList[0].DriverGuid);
			dSound.SetCooperativeLevel(this.Handle, CooperativeLevel.Priority);
			d = new BufferDescription();
			d.Flags = BufferDescriptionFlags.ControlVolume | BufferDescriptionFlags.ControlFrequency | BufferDescriptionFlags.ControlPan | BufferDescriptionFlags.ControlEffects;
		}

		private void button1_Click(object sender, EventArgs e)
		{
			sound = new SecondaryBuffer(currFile, d, dSound);
			len = sound.Caps.BufferBytes;
			string info = "Sound Info:\n";
			info += "Sample Freq: " + sound.Format.SamplesPerSecond.ToString() + "\n";
			info += "Bit/Sample: " + sound.Format.BitsPerSample.ToString() + "\n";
			info += "Channels: " + sound.Format.Channels.ToString() + "\n";
			info += "Tot Bytes: " + sound.Caps.BufferBytes.ToString() + "\n";
			info += "Bytes/sec: " + sound.Format.AverageBytesPerSecond.ToString() + "\n";
			info += "Duration: " + ((int)(len / sound.Format.AverageBytesPerSecond)).ToString() + " sec\n";
			label1.Text = info;

			sound.Play(0, BufferPlayFlags.Default);
		}


	}

	    public sealed class SoundDevices : IDisposable

    {

        private DevicesCollection dc;

        private DeviceInformation[] di;

        private Control owner;

 

        private Device D { get; set; }

 

        /// <summary>Gets the device used.</summary>

        public Device DeviceUsed { get { return D; } }

 

        /// <summary>Gets the list of device information from the operating system.</summary>

        public DeviceInformation[] DevicesInfo { get { return di; } }

 

        public SoundDevices(Control owner)

        {

            this.owner = owner;

 

            dc = new DevicesCollection();

 

            EnumerateDevices();

 

            D = new Device();

            D.SetCooperativeLevel(owner, CooperativeLevel.Priority);

        } // end constructor

 

        private void EnumerateDevices()

        {

            di = new DeviceInformation[dc.Count];

 

            int count = 0;

 

            foreach (DeviceInformation devIn in dc)

            {

                di[count] = devIn;

 

                count++;

            } // end foreach

        } // end EnumerateDevices

 

        /// <summary>Used to free all the resources used by this object.</summary>

        public void Dispose()

        {

            dc = null;

            di = null;

            owner = null;

        } // end Dispose

 

        /// <summary>Sets the device used on the operating system.</summary>

        /// <param name="deviceInfo">The device info used to determine the device to use.</param>

        public void SetDevice(DeviceInformation deviceInfo)

        {

            D = new Device(deviceInfo.DriverGuid);

            D.SetCooperativeLevel(owner, CooperativeLevel.Priority);

        } // end SetDevice

    } // end class
}
