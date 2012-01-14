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
        Object2 = (Object)DPI; //rozdzielczosc
        Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);

        Object1 = (Object)"6148";
        Object2 = (Object)DPI; 
        Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);

        Object1 = (Object)(WIA_IPS_FIRST + 9).ToString();
        Object2 = (Object)C; //kontrast
        Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);

        Object1 = (Object)(WIA_IPS_FIRST + 8).ToString();
        Object2 = (Object)B; //jasnosc
        Scanner.Items[1].Properties.get_Item(ref Object1).set_Value(ref Object2);

    }
    catch
    {
        //Message
    }
    Object1 = null;
    Object2 = null;
}