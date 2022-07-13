 $tasks = Get-ScheduledTask -TaskPath "\PROD\*" 
  foreach ($task in $tasks) 
  { 
    $Tasksettings = New-ScheduledTaskSettingsSet -StartWhenAvailable -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries 
    $changedtask = Get-ScheduledTask -TaskName $task.TaskName -TaskPath $task.TaskPath 
    $changedtask.Triggers[0].EndBoundary = [DateTime]::Now.AddYears(100).ToString('yyyy-MM-dd''T''HH:mm:ss') 
    $changedtask.Settings = $Tasksettings 
    $changedtask | Set-ScheduledTask 
 } 
