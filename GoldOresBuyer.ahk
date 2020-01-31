CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

F1::
Loop
{
    Loop
    {
        OutputDebug, "Searching for Ordan."
        PixelSearch, outputX, outputY, -768, 211, -253, 549, 0xFFFF00, 0, Fast
        if (ErrorLevel = 0)
        {
            OutputDebug, "Found Ordan."
            OutputDebug, "Right-clicking on Ordan."
            Click, right, %outputX%, %outputY%
            OutputDebug, "Moving to the trade option."
            MouseMove, 0, 26,, R
            OutputDebug, "Clicking on the trade option."
            Click
            Break
        }
    }
    Loop
    {
        OutputDebug, "Waiting for the store interface to open."
        PixelGetColor, color, -434, 298
        if (color = "0x1094BD")
        {
            OutputDebug, "Store interface is now open."
            OutputDebug, "Right-clicking on the gold ore."
            Click, right, -434, 298
            OutputDebug, "Moving to the Buy 50 option."
            MouseMove, 0, 87,, R
            OutputDebug, "Clicking on the Buy 50 option."
            Click
            OutputDebug, "Closing the store interface."
            Click, -283, 252
            Break
        }
    }
    Loop
    {
        OutputDebug, "Searching for the bank chest."
        PixelSearch, chestX, chestY, -768, 211, -253, 549, 0x00D7D7, 0, Fast
        if (ErrorLevel = 0)
        {
            OutputDebug, "Found bank chest."
            OutputDebug, "Right-clicking on the bank chest."
            Click, right, %chestX%, %chestY%
            OutputDebug, "Moving to the use option."
            MouseMove, 0, 26,, R
            OutputDebug, "Clicking on the use option."
            Click
            Loop
            {
                OutputDebug, "Waiting for the bank interface to open."
                PixelGetColor, bankcolor, -288, 268
                if (bankcolor = "0x4D5252")
                {
                    OutputDebug, "Bank interface is now open."
                    OutputDebug, "Clicking on deposit inventory."
                    Click, -322, 525
                    OutputDebug, "Closing the bank interface."
                    Click, -284, 234
                    Break
                }
            }
            Break
        }
    }
}

F2::
Reload