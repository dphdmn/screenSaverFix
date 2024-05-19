# ScreenSaverFix
A script to activate your screensaver if it does not start automatically on Windows (as a last resort).

## How It Works
This solution uses two scripts:
1. **Get-IdleTime.ps1**: A PowerShell script that retrieves the current system idle time.
2. **idle.bat**: A batch script that periodically checks the idle time and activates the screensaver if the idle time exceeds a specified threshold.
3. The script will run a screensaver file named `logon.scr`, which should be located in the same folder as the script or in your PATH.

## Customization
You can customize `idle.bat` to change the interval for checking the idle time and the threshold for starting the screensaver.

### Changing the Idle Check Interval
Modify the interval at which the idle time is checked by changing the value (in seconds) in the following line:
```bat
timeout /t 60 /nobreak >nul
```
For example, to check every 30 seconds, update it to:
```bat
timeout /t 30 /nobreak >nul
```

### Setting the Screensaver Activation Threshold
Adjust the idle time threshold (in seconds) that triggers the screensaver by modifying the following line:
```bat
set threshold=600
```
For example, to start the screensaver after 5 minutes (300 seconds) of inactivity, ensure it reads:
```bat
set threshold=300
```

## Additional Tips
- Ensure your power settings are configured so that the system's sleep or display-off time is longer than the screensaver threshold.
- Choose a reasonable interval for checking idle time to balance performance and responsiveness.
- Add this script to the startup folder or create a task schedule for automatic execution.
- To avoid having the command window on the screen, consider these options:
  1. Use [cmdow.exe](https://ritchielawrence.github.io/cmdow/) with the `/hid` option to run the batch file hidden.
  2. Move the command window to a second desktop (use Win+Tab to switch).

By following these guidelines, you can ensure your screensaver activates reliably even if it doesn't start automatically.