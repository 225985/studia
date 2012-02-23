private bool chooseDevice()
{
    try
    {
        Scanner = Dialog1.ShowSelectDevice(WIA.WiaDeviceType.ScannerDeviceType, true, true);
        if (Scanner != null) return true;
    }
    catch (Exception ex)
    {
        //Message
    }
    return false;
}

