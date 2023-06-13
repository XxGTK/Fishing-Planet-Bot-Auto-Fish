#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\Downloads\Fish_Movie_35099.ico
#AutoIt3Wrapper_Outfile=D:\Zander Buddy.exe
#AutoIt3Wrapper_Outfile_x64=D:\Zander Buddy2.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Compile_Both=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <AutoItConstants.au3>
Opt("MouseCoordMode",2)
Opt("PixelCoordMode",2)
Global $status = 0, $fish = 0, $start = 0, $ct = 0 ,$st = 0, $pt = 0 , $cp
global $color1=0xE3E3E3, $color2=0xBCBDBD, $color3=0xC37F41 , $color4 = 0xFFFFFF, $color5 = 0xF7F7F7, $color6 = 0xFF0000 , $color7 = 0x7ED322, $color8 = 0xFFC300 ,$color9=0x4DA80D,$color10=0xDC8F49
Global $x1=1254,$y1=331, $x2=1260,$y2=677, $x3=739,$y3=666, $x4=284,$y4=638, $x5=324,$y5=654, $x6 = 516, $y6 = 433, $x7= 213, $y7 = 198, $x8 = 327 , $y8 = 108, $x9 = 62,$y9 = 128,$x10=615,$y10=519,$x11=504
Global $y11=656,$x12=498,$y12=496, $x13=496,$y13=591
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ScreenCapture.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=c:\users\hardt\desktop\koda\forms\fp bot.kxf
$Form1_1 = GUICreate("Zander v.1.2", 460, 418, 1000, 100)
GUISetOnEvent($GUI_EVENT_CLOSE, "_exit")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "_mini")
#GUISetOnEvent($GUI_EVENT_MAXIMIZE, "Form1_1Maximize")
GUISetOnEvent($GUI_EVENT_RESTORE, "_rest")
$startbtn = GUICtrlCreateButton("Start(F10)", 8, 60, 123, 41)
GUICtrlSetBkColor(-1, 0x00FF00)
GUICtrlSetOnEvent(-1, "startbtnClick")
$stopbtn = GUICtrlCreateButton("Stop(F11)", 8, 110, 123, 41)
GUICtrlSetBkColor(-1, 0xFF0000)
GUICtrlSetOnEvent(-1, "stopbtnClick")
$Label1 = GUICtrlCreateLabel("Current Action:", 16, 8, 125, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
$statusread = GUICtrlCreateLabel("stop", 144, 8, 115, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label3 = GUICtrlCreateLabel("Dropdown:", 200, 85, 120, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$casttime = GUICtrlCreateInput("8000", 320, 80, 121, 28, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
GUICtrlSetLimit(-1, 4)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetTip(-1, "Min 2000 Max 9999")
$Label4 = GUICtrlCreateLabel("Twitch:", 200, 124, 84, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
$spintime = GUICtrlCreateInput("300", 320, 120, 121, 28, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
GUICtrlSetLimit(-1, 4)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetTip(-1, "Min 0 max 9999")
$Label5 = GUICtrlCreateLabel("Pause time:", 200, 167, 118, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$spause = GUICtrlCreateInput("1", 320, 160, 121, 28, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
GUICtrlSetLimit(-1, 4)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetTip(-1, "Between 1-200 best!")
$Pic1 = GUICtrlCreatePic("", 8, 264, 440, 140, BitOR($GUI_SS_DEFAULT_PIC,$WS_BORDER))

$Label6 = GUICtrlCreateLabel("Last Catched Fish:", 8, 208, 155, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
$Label7 = GUICtrlCreateLabel("Cast time:", 200, 48, 99, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
$castpower = GUICtrlCreateInput("1910", 320, 45, 121, 28, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
GUICtrlSetLimit(-1, 4)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetTip(-1, "Min 1000 max 1950")
$fishdate = GUICtrlCreateLabel("", 8, 232, 260, 28)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
HotKeySet("{F10}","startbtnClick")
HotKeySet("{F11}","stopbtnClick")

while 1

	sleep(10)
if $start = 1 then
WinActivate("FishingPlanet","")
    $cp = GUICtrlRead($castpower)
	$ct = GUICtrlRead($casttime)
	$st = GuiCtrlRead($spintime)
	$pt = GuiCtrlread($spause)
if winactive("FishingPlanet","") then
#проверка в воде ли приманка
	PixelSearch($x1-10,$y1-5,$x1+10,$y1+5,$color1,10)
	if Not @error then
		_provodka()
	else
		MouseUP($MOUSE_CLICK_LEFT)
		#проверка на посторонние окна
sleep(1000)
		PixelSearch($x7-6,$y7-6,$x7+6,$y7+6,$color7,1)
			if Not @error then
				GuiCtrlSetData($statusread,"Closing Windows 4")
				MouseClick("Left",371,556)
				sleep(2500)
			endif
sleep(700)
#заебали!
PixelSearch($x13-4,$y13-4,$x13+4,$y13+4,$color10,2)
			if Not @error then
				GuiCtrlSetData($statusread,"Closing Windows 8")
				MouseClick("Left",$x13+30,$y13)
			endif
PixelSearch($x12-4,$y12-4,$x12+4,$y12+4,$color10,2)
			if Not @error then
				GuiCtrlSetData($statusread,"Closing Windows 7")
				MouseClick("Left",$x12+30,$y12)
			endif
PixelSearch($x11-4,$y11-4,$x11+4,$y11+4,$color9,1)
			if Not @error then
				GuiCtrlSetData($statusread,"Closing Windows 6")
				MouseClick("Left",$x11+30,$y11)
			endif
		PixelSearch($x10-4,$y10-4,$x10+4,$y10+4,$color9,1)
			if Not @error then
				GuiCtrlSetData($statusread,"Closing Windows 5")
				MouseClick("Left",$x10+30,$y10)
			endif
		PixelSearch($x5-6,$y5-6,$x5+6,$y5+6,$color5,1)
			if Not @error then
				GuiCtrlSetData($statusread,"Closing Windows 3")
				MouseClick("Left",$x5,$y5)
			endif
#злоебучее окно!
sleep(700)
		PixelSearch($x8-6,$y8-6,$x8+6,$y8+6,$color7	,1)
			if Not @error then
				GuiCtrlSetData($statusread,"Closing Windows 2")
				MouseClick("Left",475,645)
			endif
#еще какое-то окно
#еще одно окно
sleep(700)
		PixelSearch($x4-6,$y4-6,$x4+6,$y4+6,$color4,1)
			if Not @error then
				GuiCtrlSetData($statusread,"Closing Windows 1")
				MouseClick("Left",$x4,$y4)
			endif
sleep(700)
#поймали рыбу?
		PixelSearch($x3-20,$y3-20,$x3+20,$y3+20,$color3,3)
			if Not @error then
				sleep(4000)
				GuiCtrlSetData($statusread,"We Catch the Fish!")
				PixelSearch($x6-20,$y6-20,$x6+20,$y6+20,$color6,3)
				if Not @error then
					GuiCtrlSetData($statusread,"No License Fish!")
					sleep(1500)
					Send("{BACKSPACE}")
					sleep(4000)
						Else
							$hgui = WinGetHandle("FishingPlanet","")
							GuiCtrlSetData($statusread,"Get the fish!")
							_ScreenCapture_CaptureWnd(@ScriptDir & "\fpbot_lastfish.jpg", $hGUI,475,520,915,660)
							GuiCtrlSetImage($Pic1,@ScriptDir & "\fpbot_lastfish.jpg")
							GuiCtrlSetData($fishdate,"Time catched: " &@Hour & ":" & @Min)
							MouseUP($MOUSE_CLICK_LEFT)
							sleep(1500)
							Send("{SPACE}")
							sleep(4000)
				EndIf
			EndIf
#закрыли всю хуету кастуем снасть
sleep(700)
#проверка на засечку
	PixelSearch($x2-2,$y2-2,$x2+2,$y2+2,$color2,5)
		if Not @error then
			sleep(1000)
			GuiCtrlSetData($statusread,"Battling!")
		Else
			sleep(1000)
			sleep(700)
		PixelSearch($x9-6,$y9-6,$x9+6,$y9+6,$color8,1)
			if Not @error then
				GuiCtrlSetData($statusread,"Need next day!")
				sleep(3000)
				Send("t")
				Send("t")
				sleep(5000)
				MouseClick("left",660,656)
				sleep(3000)
				MouseClick("left",554,483)
				sleep(3000)
				MouseClick("left",620,600)
				sleep(3000)
			Else
				sleep(1000)
				GuiCtrlSetData($statusread,"Need to cast")
				_cast()
		endif
		endif

	endif


#наконец упростил!
endif
endif
wend

Func _cast()
sleep(2000)
GuiCtrlSetData($statusread,"Casting Lure")
MouseDown($MOUSE_CLICK_LEFT)
sleep($cp)
MouseUP($MOUSE_CLICK_LEFT)
sleep($ct)
MouseDown($MOUSE_CLICK_LEFT)
endfunc

Func _provodka()
PixelSearch($x2-2,$y2-2,$x2+2,$y2+2,$color2,5)
		if Not @error then
			sleep(100	)
			GuiCtrlSetData($statusread,"Battling!")
		Else
GuiCtrlSetData($statusread,"Making magic")
MouseDown($MOUSE_CLICK_RIGHT)
sleep($st)
MouseUP($MOUSE_CLICK_RIGHT)
sleep($pt)
endif
endfunc

#Func _vimotka()
#GuiCtrlSetData($statusread,"Hold ON!")
#MouseDown($MOUSE_CLICK_LEFT)
#endfunc

Func startbtnClick()
 $start = 1
 GuiCtrlSetData($statusread,"Action!")
EndFunc
Func stopbtnClick()
 $start = 0
 GuiCtrlSetData($statusread,"Stoped!")
EndFunc

Func _exit()
	Exit
endfunc
Func _mini()
	GuiCtrlSetState($Form1_1, @SW_MINIMIZE)
endfunc
Func _rest()
	GuiCtrlSetState($Form1_1, @SW_RESTORE)
endfunc