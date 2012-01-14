using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using WIA;
using System.Drawing.Imaging;





namespace Skaner
{
    public partial class Form1 : Form
    {
        WIA.CommonDialog Dialog1 = new WIA.CommonDialog();
        WIA.Device Scanner;
        //http://motorola.usc.edu/svn/gge/ogreaddons/AudioVideoModule/inc/directshow/PSDK-Include/WiaDef.h
        bool withFeeder;
        Byte[] imageBytes;
        private const int WIA_DPS_DOCUMENT_HANDLING_SELECT_FEEDER = 1;
        private const int WIA_DPS_DOCUMENT_HANDLING_SELECT_FLATBED = 2;
        private const int WIA_DPS_DOCUMENT_HANDLING_STATUS_FEED_READY = 1;

        private const int WIA_DIP_FIRST = 2;
        private const int WIA_DPA_FIRST = WIA_DIP_FIRST + WIA_RESERVED_FOR_NEW_PROPS;
        private const int WIA_DPC_FIRST = WIA_DPA_FIRST + WIA_RESERVED_FOR_NEW_PROPS;
        private const int WIA_DPS_FIRST = WIA_DPC_FIRST + WIA_RESERVED_FOR_NEW_PROPS;
        private const int WIA_IPA_FIRST = WIA_DPS_FIRST + WIA_RESERVED_FOR_NEW_PROPS;
        private const int WIA_IPC_FIRST = WIA_IPA_FIRST + WIA_RESERVED_FOR_NEW_PROPS;
        private const int WIA_IPS_FIRST = WIA_IPC_FIRST + WIA_RESERVED_FOR_NEW_PROPS;

        private const int WIA_IPS_PAGES = 3096;
        private const int WIA_RESERVED_FOR_NEW_PROPS = 1024;


        private const int WIA_DPS_PAGE_SIZE = WIA_DPS_FIRST + 23;
        private const int WIA_DPS_PAGE_WIDTH = WIA_DPS_FIRST + 24;
        private const int WIA_DPS_PAGE_HEIGHT = WIA_DPS_FIRST + 25;


        private const int WIA_IPS_ORIENTATION = WIA_IPS_FIRST + 10;
        private const int WIA_IPS_XPOS = WIA_IPS_FIRST + 3;
        private const int WIA_IPS_YPOS = WIA_IPS_FIRST + 4;
        private const int WIA_IPS_XEXTENT = WIA_IPS_FIRST + 5;
        private const int WIA_IPS_YEXTENT = WIA_IPS_FIRST + 6;
        //private const int WIA_IPS_XRES = WIA_IPS_FIRST + 1;
        //private const int WIA_IPS_YRES = WIA_IPS_FIRST + 2;


        private const int WIA_PAGE_A4 = 0;
        private const int WIA_PAGE_LETTER = 1;
        private const int WIA_PAGE_CUSTOM = 2;


        private const int WIA_PROPERTIES_WIA_RESERVED_FOR_NEW_PROPS = 1024;
        private const int WIA_PROPERTIES_WIA_DIP_FIRST = 2;
        private const int WIA_PROPERTIES_WIA_DPA_FIRST = WIA_PROPERTIES_WIA_DIP_FIRST + WIA_PROPERTIES_WIA_RESERVED_FOR_NEW_PROPS;
        private const int WIA_PROPERTIES_WIA_DPC_FIRST = WIA_PROPERTIES_WIA_DPA_FIRST + WIA_PROPERTIES_WIA_RESERVED_FOR_NEW_PROPS;


        private const int WIA_PROPERTIES_WIA_DPS_FIRST = WIA_PROPERTIES_WIA_DPC_FIRST + WIA_PROPERTIES_WIA_RESERVED_FOR_NEW_PROPS;
        private const int WIA_PROPERTIES_WIA_DPS_DOCUMENT_HANDLING_STATUS = WIA_PROPERTIES_WIA_DPS_FIRST + 13;
        private const int WIA_PROPERTIES_WIA_DPS_DOCUMENT_HANDLING_SELECT = WIA_PROPERTIES_WIA_DPS_FIRST + 14;
        private const string WIA_DPS_DOCUMENT_HANDLING_STATUS_STR = "Document Handling Status";


        private const double WIA_ERRORS_BASE_VAL_WIA_ERROR = 2149646336;
        private const double WIA_ERRORS_WIA_ERROR_PAPER_EMPTY = WIA_ERRORS_BASE_VAL_WIA_ERROR + 3;


        private const int WIA_IPS_CUR_INTENT = 6146;
        private const int WIA_IPS_XRES = 6147;
        private const int WIA_IPS_YRES = 6148;


        private const int WIA_INTENT_NONE = 0x00000000;
        private const int WIA_INTENT_IMAGE_TYPE_COLOR = 0x00000001;
        private const int WIA_INTENT_IMAGE_TYPE_GRAYSCALE = 0x00000002;
        private const int WIA_INTENT_IMAGE_TYPE_TEXT = 0x00000004;
        private const int WIA_INTENT_IMAGE_TYPE_MASK = 0x0000000F;
        private const int WIA_INTENT_MINIMIZE_SIZE = 0x00010000;
        private const int WIA_INTENT_MAXIMIZE_QUALITY = 0x00020000;
        private const int WIA_INTENT_BEST_PREVIEW = 0x00040000;
        private const int WIA_INTENT_SIZE_MASK = 0x000F0000;
        private const int FEED_READY = 0x01;


        private const string wiaFormatBMP = "{B96B3CAB-0728-11D3-9D7B-0000F81EF32E}";
        private const string wiaFormatJPEG = "{B96B3CAE-0728-11D3-9D7B-0000F81EF32E}";

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            withFeeder = false;
            WIA.ImageFile Img = null;
            Scanner = null;
            try
            {
                if (Scanner == null)
                    if (chooseDevice())
                    {
                        InitializeITEM();//inicjuje ustawienia skanera      
                        Img = (ImageFile)Dialog1.ShowTransfer(Scanner.Items[1], wiaFormatBMP, true);
                        imageBytes = (byte[])Img.FileData.get_BinaryData(); // <– Converts the ImageFile to a byte array
                        MemoryStream ms = new MemoryStream(imageBytes);
                        Image image = Image.FromStream(ms);
                        pictureBox1.Image = image;
                    }
                    else
                    {
                        InitializeITEM();//inicjuje ustawienia skanera      
                        Img = (ImageFile)Dialog1.ShowTransfer(Scanner.Items[1], wiaFormatBMP, true);
                        imageBytes = (byte[])Img.FileData.get_BinaryData(); // <– Converts the ImageFile to a byte array
                        MemoryStream ms = new MemoryStream(imageBytes);
                        Image image = Image.FromStream(ms);
                        pictureBox1.SizeMode = PictureBoxSizeMode.CenterImage;
                        pictureBox1.Image = image;
                        return;
                    }
                else
                {
                    InitializeITEM();//inicjuje ustawienia skanera 
                    Img = (ImageFile)Dialog1.ShowTransfer(Scanner.Items[1], wiaFormatBMP, true);
                    
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Skanuj...",
                                 MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                if (Img != null)
                    Marshal.ReleaseComObject(Img);
            }
        }

        private void InitializeITEM()
        {
            Object Object1 = null;
            Object Object2 = null;
            Int32 DPI = Convert.ToInt32(textBox1.Text) ;
            Int32 C = Convert.ToInt32(textBox2.Text);
            Int32 B = Convert.ToInt32(textBox3.Text);
            try
            {
                Object1 = (Object)WIA_IPS_CUR_INTENT.ToString();// "6146";
                
                if(radioButton1.Checked)
                    Object2 = (Object)WIA_INTENT_IMAGE_TYPE_COLOR;//WIA_INTENT_IMAGE_TYPE_GRAYSCALE;
                else
                    Object2 = (Object)WIA_INTENT_IMAGE_TYPE_GRAYSCALE;
                Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);

                Object1 = (Object)"6147";
                Object2 = (Object)DPI; //rozdzielczość
                Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);

                Object1 = (Object)"6148";
                Object2 = (Object)DPI; 
                Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);

                Object1 = (Object)(WIA_IPS_FIRST + 9).ToString();
                Object2 = (Object)C; //kontrast
                Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);

                Object1 = (Object)(WIA_IPS_FIRST + 8).ToString();
                Object2 = (Object)B; //jasność
                Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);

                //Object1 = (Object)"6152";
                //Object2 = (Object)768;
                //Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);
                

                
            }
            catch
            {
                MessageBox.Show("Skaner nie jest gotowy lub nie obsługuje tej funkcji.\r\n\r\n Przywrócono ustawienia domyślne.", "Inicjalizacja",
                                 MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            Object1 = null;
            Object2 = null;
        }


        private bool chooseDevice()
        {
            try
            {
                Scanner = Dialog1.ShowSelectDevice(WIA.WiaDeviceType.ScannerDeviceType, true, true);
                if (Scanner != null) return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Błąd ! Nie wybrano skanera " + ex.Message, "Wybierz urządzenie",
                                 MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (pictureBox1.Image != null)
            {
                

                FileStream file = File.OpenWrite("d.bmp");
                file.Write(imageBytes,0,imageBytes.Length);
                file.Close();
                MessageBox.Show("zapisano");
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            radioButton1.Select();
        }

        

        



    }
}
