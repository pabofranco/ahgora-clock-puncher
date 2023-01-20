# Ahgora-clock-puncher v1

An automatic clock puncher for Ahgora. There are two scheduler files to be added to Windows' Scheduler.<br />
Remember you can configure the scheduler to run jobs only in certains days or if the notebook is using the power supply instead of the battery.


# <b>Configuration</b>

* <b>Powershell Configuration</b>
  * Open Powershell as administrator
  * Run the command Set-ExecutionPolicy RemoteSigned
  * Accept with 'A'
  * Close Powershell

* <b>Clockpuncher Configuration</b>
  * Fill the <b>config.cfg</b> file with your data without quotation marks (" or ')
  * The field 'Identity' can be obtained by punching the clock via browser and retrieving the request payload via developer console (chrome)
  
  
# Run
  * Open Powershell on the script location
  * Run the command &.\ClockPuncher_v1.ps1
