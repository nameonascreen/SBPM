Sub SkinSteam()
Dim WshShell
Set WshShell = Wscript.CreateObject("Wscript.Shell")
Set objShell = CreateObject("Wscript.Shell")
Set WshEnv = WshShell.Environment("PROCESS")
Set objShell = CreateObject("Wscript.Shell")
strPath = Wscript.ScriptFullName
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile(strPath)
strFolder = objFSO.GetParentFolderName(objFile)
objShell.CurrentDirectory = strFolder
WshEnv("SEE_MASK_NOZONECHECKS") = 1 

If objFSO.FolderExists("C:\Program Files (x86)\Steam\skins\SBPM") Then 
	objFSO.CopyFolder "C:\Program Files (x86)\Steam\skins\SBPM\resource", "C:\Program Files (x86)\Steam\tenfoot\resource"
End If

WshEnv.Remove("SEE_MASK_NOZONECHECKS")

End Sub

Sub LaunchSteam()
  Set objShell = CreateObject("WScript.Shell")
  Set RunSteam = objShell.Exec("C:\Program Files (x86)\Steam\Steam.exe -tenfoot -bigpicture -noverifyfiles -norepairfiles -silent steam://open/bigpicture")
' Use this parameter for a true console version of steam: -steamconsole
' There will be nog exit big picture option in the exit menu, just like the suspend option etc.
End Sub

Call SkinSteam
Call LaunchSteam
 

