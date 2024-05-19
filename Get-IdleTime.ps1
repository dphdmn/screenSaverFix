Add-Type @"
using System;
using System.Runtime.InteropServices;

public class IdleTime
{
    [DllImport("user32.dll")]
    public static extern bool GetLastInputInfo(ref LASTINPUTINFO plii);

    public struct LASTINPUTINFO
    {
        public uint cbSize;
        public uint dwTime;
    }

    public static uint GetIdleTime()
    {
        LASTINPUTINFO lii = new LASTINPUTINFO();
        lii.cbSize = (uint)System.Runtime.InteropServices.Marshal.SizeOf(lii);
        GetLastInputInfo(ref lii);

        return ((uint)Environment.TickCount - lii.dwTime) / 1000;
    }
}
"@

$idleTime = [IdleTime]::GetIdleTime()
Write-Output $idleTime
