;-------------------------------------------------------
; inicialização
;-------------------------------------------------------
ListLines, Off
My_ScriptName:=%True%
Try Menu, Tray, Icon, %My_ScriptName%
Gui, SingleInstance_force:Show, Hide, [%My_ScriptName%]
Gui, SingleInstance_force:+HwndMy_guiid
DetectHiddenWindows, On
WinGet, My_list, List, [%My_ScriptName%] ahk_class AutoHotkeyGUI
Loop, % My_list {
  IfEqual, My_guiid, % My_id:=My_list%A_Index%, Continue
  WinGet, My_pid, PID, ahk_id %My_id%
  WinClose, ahk_class AutoHotkey ahk_pid %My_pid%
  WinWaitClose, ahk_id %My_id%
}
DetectHiddenWindows, Off
SetWorkingDir, % RegExReplace(My_ScriptName,"\\[^\\]*$")
;-----------------------
Reload() {
  static My_ScriptName:=%True%
  Try {
    if My_ScriptName=
      return
    else if InStr(My_ScriptName,".exe")
      Run, "%My_ScriptName%"
    else
      Run, "%A_AhkPath%" "%My_ScriptName%"
    ExitApp
  }
}
ListLines, On

;-------------------------------------------------------
; Funções de verificação de usuários
;-------------------------------------------------------
SWP_Initialize() 
AutorisedComputer := array()
;AutorisedComputer.push(" ")

Username := A_UserName

for key, val in AutorisedComputer {
 UserOK := SWP_IsUserAuthenticated(%Username%,val)  
 If( UserOK ){
   break
}
}
; faz a verificação se o usuário é valido.
;if(!UserOk){       ; xd cracked by rigwild
; MsgBox Fuck off. 
; ExitApp
; 
;}

;-------------------------------------------------------
; declarações e configs
;-------------------------------------------------------

#SingleInstance, force
#MaxThreadsPerHotkey 3
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetDefaultMouseSpeed, 0
SetBatchLines, -1
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SetWinDelay, -1
SetKeyDelay, -1
SetControlDelay -1 
SetTitleMatchMode, Regex

Menu, Tray, Tip, DPF__cracked_by_rigwild__Mod____by__SpaceCowb0y
Menu, Tray, Add, Open DPF__cracked_by_rigwild__Mod____by__SpaceCowb0y, showGUI
Menu, Tray, Default,Open DPF__cracked_by_rigwild__Mod____by__SpaceCowb0y


;-------------------------------------------------------
; GLOBAL 
;-------------------------------------------------------

;imagens no diretório local
my_picturefile = %A_Temp%\
my_picturefile3 = %A_Temp%\
Pic2 = %A_Temp%\
PicDonate = %A_Temp%\

; copia as imagens para o diretorio.
; FileInstall, DofusPouletFlemmards.png, %my_picturefile%, 1
; FileInstall, DofusPouletFlemmardsMini.png, %Pic2%, 1
; FileInstall, donate.png, %PicDonate%, 1
; FileInstall, DofusPouletFlemmardsPoussin.png, %my_picturefile3%, 1

global DofusPath:= A_AppData "\..\Local\Ankama\zaap\retro\resources\app\retroclient\dofus.exe"

;seta no nome da janela para a o nome do char
class NicknamesPaired {
	__new( name, pid ) {
		this.name := name
		this.pid := pid
	}
}

;lança o buff
;retirar essa classe/função
class Buff{
	__new(cast, casted){
	;this.spell := spell
	this.cast := cast
		this.casted := casted
}
}

ReadSettings(value,section,file, key ){
		IniRead,%value%,%file%,%section%,%value%,%key%
}

WriteSettings(value,section,file,key){
	IniWrite,%key%,%file%,%section%,%value%
}


UpdateSettings(value,section,file, key ){
		IniWrite,%key%,%file%,%section%,%value%
		IniRead,%value%,%file%,%section%,%value%
}



;-------------------------------------------------------
; SETTINGS.INI 
;cria a pasta de config em meus documentos
;-------------------------------------------------------

IfNotExist %A_MyDocuments%\Dofus_Helper
{
	FileCreateDir, %A_MyDocuments%\Dofus_Helper
	FileCreateDir, %A_MyDocuments%\Dofus_Helper\SCREENSHOT
}

IfNotExist %A_MyDocuments%\Dofus_Helper\SCREENSHOT-TROCA
{
	FileCreateDir, %A_MyDocuments%\Dofus_Helper\SCREENSHOT-TROCA
}

SetWorkingDir %A_MyDocuments%\Dofus_Helper

;----------------------
; GUI
;----------------------

global GUIsizeW = 920
global GUIsizeH = 680
global TABsizeW = GUIsizeW-30
global TABsizeH = GUIsizeH-20

global editFileButtonX = TABsizeW-100
global editFileButtonY = TABsizeW+80
global saveButtonX = TABsizeW-100
global saveButtonY = TABsizeY+60
global SetPosButtonX = TABsizeW-100
global SetPosButtonY = TABsizeY+80

global hotkeySize = 95
global centerPosX = GUIsizeW/2
; o que é jesuisunpoulet
global jesuisunpoulet := 0

Iniread,jesuisunpoulet,settings.ini,chicken,jesuisunpoulet,0



;-------------------------------------------------------
; ARRAYS 
;-------------------------------------------------------

; global Account := array()
; global AccountInTeam := array()
; global Team := array()

global DofusWindows := array()
global Nicknames := array()
global DisabledChar := array()
global EnabledChar := array()

global DofusWindowsName := array()
global DisabledCharCount := 0
global BeepArray := array()
global LootArray := array()

global SkippingArray := array()
global CupiditeArray := array()
global ChanceArray := array()
global ChestArray:= array()

; global CSP1Array:= array()
; global CSP2Array:= array()
; global CSP3Array:= array()
; global CSP4Array:= array()

global mapColor:="0x0BC8FF"


;global mapColor:="0x09CDF8"

;----------------------
; Windows Manager
;----------------------
global getListOfDofusPID := array()


ReadSettings("DofusPath","AutoLogIn","settings.ini",DofusPath)
WriteSettings("DofusPath","AutoLogIn","settings.ini",DofusPath)
global openHelpKey:= "^w"
ReadSettings("openHelpKey","GUI","settings.ini",openHelpKey)
WriteSettings("openHelpKey","GUI","settings.ini",openHelpKey)

global ReloadKey :="F11"
ReadSettings("ReloadKey","GUI","settings.ini",ReloadKey)
WriteSettings("ReloadKey","GUI","settings.ini",ReloadKey)
global ExitKey :="F12"
ReadSettings("ExitKey","GUI","settings.ini",ExitKey)
WriteSettings("ExitKey","GUI","settings.ini",ExitKey)

if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
global PreviousTabKey :="F1"
ReadSettings("PreviousTabKey","WindowsManager","settings.ini",PreviousTabKey)
WriteSettings("PreviousTabKey","WindowsManager","settings.ini",PreviousTabKey)


global NextTabKey :="F2"
ReadSettings("NextTabKey","WindowsManager","settings.ini",NextTabKey)
WriteSettings("NextTabKey","WindowsManager","settings.ini",NextTabKey)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;------------------------
; Auto 
;------------------------

;---------------------
;aqui existiam funções de login automatico

;---------------------
global AutoPairingKey:="^&"
global PairingDelay := 400
global PairingChatPositionX := 620
global PairingChatPositionY := 1015
ReadSettings("AutoPairingKey","Pairing","settings.ini",AutoPairingKey)
WriteSettings("AutoPairingKey","Pairing","settings.ini",AutoPairingKey)
ReadSettings("PairingDelay","Pairing","settings.ini",PairingDelay)
WriteSettings("PairingDelay","Pairing","settings.ini",PairingDelay)
ReadSettings("PairingChatPositionX","Pairing","coordinates.ini",PairingChatPositionX)
WriteSettings("PairingChatPositionX","Pairing","coordinates.ini",PairingChatPositionX)
ReadSettings("PairingChatPositionY","Pairing","coordinates.ini",PairingChatPositionY)
WriteSettings("PairingChatPositionY","Pairing","coordinates.ini",PairingChatPositionY)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
;auto troca de janela em combate
global AutoSwitchKey:="!q"
global AutoSwitchDelay := 400
global NameTurnPosX1 := 550
global NameTurnPosY1 := 110
global NameTurnPosX2 := 870
global NameTurnPosY2 := 155
ReadSettings("AutoSwitchKey","AutoSwitch","settings.ini",AutoSwitchKey)
WriteSettings("AutoSwitchKey","AutoSwitch","settings.ini",AutoSwitchKey)
ReadSettings("AutoSwitchDelay","AutoSwitch","settings.ini",AutoSwitchDelay)
WriteSettings("AutoSwitchDelay","AutoSwitch","settings.ini",AutoSwitchDelay)

ReadSettings("NameTurnPosX1","AutoSwitch","coordinates.ini",NameTurnPosX1)
WriteSettings("NameTurnPosX1","AutoSwitch","coordinates.ini",NameTurnPosX1)
ReadSettings("NameTurnPosY1","AutoSwitch","coordinates.ini",NameTurnPosY1)
WriteSettings("NameTurnPosY1","AutoSwitch","coordinates.ini",NameTurnPosY1)
ReadSettings("NameTurnPosX2","AutoSwitch","coordinates.ini",NameTurnPosX2)
WriteSettings("NameTurnPosX2","AutoSwitch","coordinates.ini",NameTurnPosX2)
ReadSettings("NameTurnPosY2","AutoSwitch","coordinates.ini",NameTurnPosY2)
WriteSettings("NameTurnPosY2","AutoSwitch","coordinates.ini",NameTurnPosY2)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
;da ready automatico
global AutoReadyKey:="^r"
global ReadyDelay := 100
global ReadyButtonX := 1515
global ReadyButtonY := 770
ReadSettings("AutoReadyKey","AutoReady","settings.ini",AutoReadyKey)
WriteSettings("AutoReadyKey","AutoReady","settings.ini",AutoReadyKey)
ReadSettings("ReadyDelay","AutoReady","settings.ini",ReadyDelay)
WriteSettings("ReadyDelay","AutoReady","settings.ini",ReadyDelay)
ReadSettings("ReadyButtonX","AutoReady","coordinates.ini",ReadyButtonX)
WriteSettings("ReadyButtonX","AutoReady","coordinates.ini",ReadyButtonX)
ReadSettings("ReadyButtonY","AutoReady","coordinates.ini",ReadyButtonY)
WriteSettings("ReadyButtonY","AutoReady","coordinates.ini",ReadyButtonY)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
;da join automatico
global AutoJoinKey :="^z"
global JoinDelay := 100
ReadSettings("AutoJoinKey","AutoJoin","settings.ini",AutoJoinKey)
WriteSettings("AutoJoinKey","AutoJoin","settings.ini",AutoJoinKey)
ReadSettings("JoinDelay","AutoJoin","settings.ini",JoinDelay)
WriteSettings("JoinDelay","AutoJoin","settings.ini",JoinDelay)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoClickKey :="!LButton"
global ClickDelay := 100
global ClickRandomDelay := 0

ReadSettings("AutoClickKey","AutoClick","settings.ini",AutoClickKey)
WriteSettings("AutoClickKey","AutoClick","settings.ini",AutoClickKey)

ReadSettings("ClickDelay","AutoClick","settings.ini",ClickDelay)
WriteSettings("ClickDelay","AutoClick","settings.ini",ClickDelay)

ReadSettings("ClickRandomDelay","AutoClick","settings.ini",ClickRandomDelay)
WriteSettings("ClickRandomDelay","AutoClick","settings.ini",ClickRandomDelay)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoInviteKey:="^i"
global InviteDelay := 100
ReadSettings("AutoInviteKey","AutoInvite","settings.ini",AutoInviteKey)
WriteSettings("AutoInviteKey","AutoInvite","settings.ini",AutoInviteKey)
ReadSettings("InviteDelay","AutoInvite","settings.ini",InviteDelay)
WriteSettings("InviteDelay","AutoInvite","settings.ini",InviteDelay)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoMoveKey:="!RButton"
global MoveDelay := 100
global MoveRandomDelay := 0
ReadSettings("AutoMoveKey","AutoMove","settings.ini",AutoMoveKey)
WriteSettings("AutoMoveKey","AutoMove","settings.ini",AutoMoveKey)

ReadSettings("MoveDelay","AutoMove","settings.ini",MoveDelay)
WriteSettings("MoveDelay","AutoMove","settings.ini",MoveDelay)

ReadSettings("MoveRandomDelay","AutoMove","settings.ini",MoveRandomDelay)
WriteSettings("MoveRandomDelay","AutoMove","settings.ini",MoveRandomDelay)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoSkipKey :="!s"
global SkipDelay := 100
global SkipKey := "s"
ReadSettings("AutoSkipKey","AutoSkipKey","settings.ini",AutoSkipKey)
WriteSettings("AutoSkipKey","AutoSkipKey","settings.ini",AutoSkipKey)
ReadSettings("SkipDelay","AutoSkipKey","settings.ini",SkipDelay)
WriteSettings("SkipDelay","AutoSkipKey","settings.ini",SkipDelay)
ReadSettings("SkipKey","AutoSkipKey","settings.ini",SkipKey)
WriteSettings("SkipKey","AutoSkipKey","settings.ini",SkipKey)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}

;---------------------
global AutoCtrlClick :="!^d"
global ClickCount := 10
ReadSettings("AutoCtrlClick","AutoCtrlClick","settings.ini",AutoCtrlClick)
WriteSettings("AutoCtrlClick","AutoCtrlClick","settings.ini",AutoCtrlClick)
ReadSettings("ClickCount","AutoCtrlClick","settings.ini",ClickCount)
WriteSettings("ClickCount","AutoCtrlClick","settings.ini",ClickCount)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoNoLootKey:="^e"
global NoLootDelay:=100
ReadSettings("AutoNoLootKey","AutoNoLoot","settings.ini",AutoNoLootKey)
WriteSettings("AutoNoLootKey","AutoNoLoot","settings.ini",AutoNoLootKey)
ReadSettings("NoLootDelay","AutoNoLoot","settings.ini",NoLootDelay)
WriteSettings("NoLootDelay","AutoNoLoot","settings.ini",NoLootDelay)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoEmptyBankKey:="+q"
global EmptyBankDelay:=400
ReadSettings("AutoEmptyBankKey","AutoEmptyBank","settings.ini",AutoEmptyBankKey)
WriteSettings("AutoEmptyBankKey","AutoEmptyBank","settings.ini",AutoEmptyBankKey)
ReadSettings("EmptyBankDelay","AutoEmptyBank","settings.ini",EmptyBankDelay)
WriteSettings("EmptyBankDelay","AutoEmptyBank","settings.ini",EmptyBankDelay)

;---------------------
global LeftKey:="Left"
global RightKey:="Right"
global TopKey:="Up"
global BottomKey:="Down"

ReadSettings("LeftKey","AutoChangeMap","settings.ini",LeftKey)
WriteSettings("LeftKey","AutoChangeMap","settings.ini",LeftKey)

ReadSettings("RightKey","AutoChangeMap","settings.ini",RightKey)
WriteSettings("RightKey","AutoChangeMap","settings.ini",RightKey)

ReadSettings("TopKey","AutoChangeMap","settings.ini",TopKey)
WriteSettings("TopKey","AutoChangeMap","settings.ini",TopKey)

ReadSettings("BottomKey","AutoChangeMap","settings.ini",BottomKey)
WriteSettings("BottomKey","AutoChangeMap","settings.ini",BottomKey)


;---------------------
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
;autopoção da lembranca
global AutoPopoRappelKey:="!a"
global PopoRappelKey:="&"
global PopoRappelDelay:= 0
ReadSettings("AutoPopoRappelKey","AutoPopoRappel","settings.ini",AutoPopoRappelKey)
WriteSettings("AutoPopoRappelKey","AutoPopoRappel","settings.ini",AutoPopoRappelKey)
ReadSettings("PopoRappelKey","AutoPopoRappel","settings.ini",PopoRappelKey)
WriteSettings("PopoRappelKey","AutoPopoRappel","settings.ini",PopoRappelKey)
ReadSettings("PopoRappelDelay","AutoPopoRappel","settings.ini",PopoRappelDelay)
WriteSettings("PopoRappelDelay","AutoPopoRappel","settings.ini",PopoRappelDelay)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
;auto bonta
global AutoPopoBontaKey:="!z"
global PopoBontaKey:="-"
global PopoBontaDelay:= 0
ReadSettings("AutoPopoBontaKey","AutoPopoBonta","settings.ini",AutoPopoBontaKey)
WriteSettings("AutoPopoBontaKey","AutoPopoBonta","settings.ini",AutoPopoBontaKey)
ReadSettings("PopoBontaKey","AutoPopoBonta","settings.ini",PopoBontaKey)
WriteSettings("PopoBontaKey","AutoPopoBonta","settings.ini",PopoBontaKey)
ReadSettings("PopoBontaDelay","AutoPopoBonta","settings.ini",PopoBontaDelay)
WriteSettings("PopoBontaDelay","AutoPopoBonta","settings.ini",PopoBontaDelay)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
;áutobrak
global AutoPopoBrakmarKey:="!e"
global PopoBrakmarKey:= """"
global PopoBrakmarDelay:= 0
ReadSettings("AutoPopoBrakmarKey","AutoPopoBrakmar","settings.ini",AutoPopoBrakmarKey)
WriteSettings("AutoPopoBrakmarKey","AutoPopoBrakmar","settings.ini",AutoPopoBrakmarKey)
ReadSettings("PopoBrakmarKey","AutoPopoBrakmar","settings.ini",PopoBrakmarKey)
WriteSettings("PopoBrakmarKey","AutoPopoBrakmar","settings.ini",PopoBrakmarKey)
ReadSettings("PopoBrakmarDelay","AutoPopoBrakmar","settings.ini",PopoBrakmarDelay)
WriteSettings("PopoBrakmarDelay","AutoPopoBrakmar","settings.ini",PopoBrakmarDelay)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
;auto pao
global AutoBreadKey:="!b"
global BreadX:=0
ReadSettings("BreadX","AutoBread","coordinates.ini",BreadX)
WriteSettings("BreadX","AutoBread","coordinates.ini",BreadX)
global BreadY:=0
ReadSettings("BreadY","AutoBread","coordinates.ini",BreadY)
WriteSettings("BreadY","AutoBread","coordinates.ini",BreadY)

global BreadDelay:= 0
ReadSettings("AutoBreadKey","AutoBread","settings.ini",AutoBreadKey)
WriteSettings("AutoBreadKey","AutoBread","settings.ini",AutoBreadKey)



ReadSettings("BreadDelay","AutoBread","settings.ini",BreadDelay)
WriteSettings("BreadDelay","AutoBread","settings.ini",BreadDelay)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoMessage1Key:="!j"
global CustomText1:=""
ReadSettings("AutoMessage1Key","AutoMessage1","settings.ini",AutoMessage1Key)
WriteSettings("AutoMessage1Key","AutoMessage1","settings.ini",AutoMessage1Key)
ReadSettings("CustomText1","AutoMessage1","settings.ini",CustomText1)
WriteSettings("CustomText1","AutoMessage1","settings.ini",CustomText1)

if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoMessage2Key:="!k"
global CustomText2:=""
ReadSettings("AutoMessage2Key","AutoMessage2","settings.ini",AutoMessage2Key)
WriteSettings("AutoMessage2Key","AutoMessage2","settings.ini",AutoMessage2Key)
ReadSettings("CustomText2","AutoMessage2","settings.ini",CustomText2)
WriteSettings("CustomText2","AutoMessage2","settings.ini",CustomText2)

if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoMessage3Key:="!l"
global CustomText3:=" "
ReadSettings("AutoMessage3Key","AutoMessage3","settings.ini",AutoMessage3Key)
WriteSettings("AutoMessage3Key","AutoMessage3","settings.ini",AutoMessage3Key)
ReadSettings("CustomText3","AutoMessage3","settings.ini",CustomText3)
WriteSettings("CustomText3","AutoMessage3","settings.ini",CustomText3)

if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;---------------------
global AutoTradeKey:="+e"
global TradeDelay := 100
global TradeNamePosX1:=690
global TradeNamePosY1:=395
global TradeNamePosX2:=1240
global TradeNamePosY2:=435
global TradeAcceptButtonX1:= 1413
global TradeAcceptButtonY1 := 751
global AcceptButtonColor:="0x0061FF"
ReadSettings("AutoTradeKey","AutoTrade","settings.ini",AutoTradeKey)
WriteSettings("AutoTradeKey","AutoTrade","settings.ini",AutoTradeKey)
ReadSettings("TradeDelay","AutoTrade","settings.ini",TradeDelay)
WriteSettings("TradeDelay","AutoTrade","settings.ini",TradeDelay)

ReadSettings("TradeNamePosX1","AutoTrade","coordinates.ini",TradeNamePosX1)
WriteSettings("TradeNamePosX1","AutoTrade","coordinates.ini",TradeNamePosX1)

ReadSettings("TradeNamePosY1","AutoTrade","coordinates.ini",TradeNamePosY1)
WriteSettings("TradeNamePosY1","AutoTrade","coordinates.ini",TradeNamePosY1)

ReadSettings("TradeNamePosX2","AutoTrade","coordinates.ini",TradeNamePosX2)
WriteSettings("TradeNamePosX2","AutoTrade","coordinates.ini",TradeNamePosX2)

ReadSettings("TradeNamePosY2","AutoTrade","coordinates.ini",TradeNamePosY2)
WriteSettings("TradeNamePosY2","AutoTrade","coordinates.ini",TradeNamePosY2)

ReadSettings("TradeAcceptButtonX1","AutoTrade","coordinates.ini",TradeAcceptButtonX1)
WriteSettings("TradeAcceptButtonX1","AutoTrade","coordinates.ini",TradeAcceptButtonX1)
ReadSettings("TradeAcceptButtonY1","AutoTrade","coordinates.ini",TradeAcceptButtonY1)
WriteSettings("TradeAcceptButtonY1","AutoTrade","coordinates.ini",TradeAcceptButtonY1)
ReadSettings("AcceptButtonColor","AutoTrade","settings.ini",AcceptButtonColor)
WriteSettings("AcceptButtonColor","AutoTrade","settings.ini",AcceptButtonColor)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}
;-----------------------
global EndFightIndicatorPosX1 := 1301
global EndFightIndicatorPosY1 := 842
ReadSettings("EndFightIndicatorPosX1","EndFightIndicatorPosition","coordinates.ini",EndFightIndicatorPosX1)
WriteSettings("EndFightIndicatorPosX1","EndFightIndicatorPosition","coordinates.ini",EndFightIndicatorPosX1)
ReadSettings("EndFightIndicatorPosY1","EndFightIndicatorPosition","coordinates.ini",EndFightIndicatorPosY1)
WriteSettings("EndFightIndicatorPosY1","EndFightIndicatorPosition","coordinates.ini",EndFightIndicatorPosY1)

;------------------------
; Auto Buff
;------------------------
;aqui existiam autobuff

;---------------------
global TurnIndicatorPosX1 := 333
global TurnIndicatorPosY1 := 745
global TurnIndicatorPosX2 := 1580
global TurnIndicatorPosY2 := 750
ReadSettings("TurnIndicatorPosX1","AutoBuff","coordinates.ini",TurnIndicatorPosX1)
WriteSettings("TurnIndicatorPosX1","AutoBuff","coordinates.ini",TurnIndicatorPosX1)
ReadSettings("TurnIndicatorPosY1","AutoBuff","coordinates.ini",TurnIndicatorPosY1)
WriteSettings("TurnIndicatorPosY1","AutoBuff","coordinates.ini",TurnIndicatorPosY1)
ReadSettings("TurnIndicatorPosX2","AutoBuff","coordinates.ini",TurnIndicatorPosX2)
WriteSettings("TurnIndicatorPosX2","AutoBuff","coordinates.ini",TurnIndicatorPosX2)
ReadSettings("TurnIndicatorPosY2","AutoBuff","coordinates.ini",TurnIndicatorPosY2)
WriteSettings("TurnIndicatorPosY2","AutoBuff","coordinates.ini",TurnIndicatorPosY2)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}

;------------------------
; GUI CONTROL IU
;------------------------

global ControlGUIFont:="Candara"
ReadSettings("ControlGUIFont","ControlGUI","controlGUI.ini",ControlGUIFont)
WriteSettings("ControlGUIFont","ControlGUI","controlGUI.ini",ControlGUIFont)
global ControlGUIFontSize:="12"
ReadSettings("ControlGUIFontSize","ControlGUI","controlGUI.ini",ControlGUIFontSize)
WriteSettings("ControlGUIFontSize","ControlGUI","controlGUI.ini",ControlGUIFontSize)
global ControlGUIFontColor:="ffc828"
ReadSettings("ControlGUIFontColor","ControlGUI","controlGUI.ini",ControlGUIFontColor)
WriteSettings("ControlGUIFontColor","ControlGUI","controlGUI.ini",ControlGUIFontColor)
global ControlGUIFontOnColor:="00cc00"
ReadSettings("ControlGUIFontOnColor","ControlGUI","controlGUI.ini",ControlGUIFontOnColor)
WriteSettings("ControlGUIFontOnColor","ControlGUI","controlGUI.ini",ControlGUIFontOnColor)
global ControlGUIFontOffColor:="red"
ReadSettings("ControlGUIFontOffColor","ControlGUI","controlGUI.ini",ControlGUIFontOffColor)
WriteSettings("ControlGUIFontOffColor","ControlGUI","controlGUI.ini",ControlGUIFontOffColor)
global ControlGUIFontOnOffSize:="12"
ReadSettings("ControlGUIFontOnOffSize","ControlGUI","controlGUI.ini",ControlGUIFontOnOffSize)
WriteSettings("ControlGUIFontOnOffSize","ControlGUI","controlGUI.ini",ControlGUIFontOnOffSize)
global ControlGUIBackgroundColor:="0b1013"
ReadSettings("ControlGUIBackgroundColor","ControlGUI","controlGUI.ini",ControlGUIBackgroundColor)
WriteSettings("ControlGUIBackgroundColor","ControlGUI","controlGUI.ini",ControlGUIBackgroundColor)
global GuiControlPosX:=0
ReadSettings("GuiControlPosX","ControlGUI","controlGUI.ini",GuiControlPosX)
WriteSettings("GuiControlPosX","ControlGUI","controlGUI.ini",GuiControlPosX)
global GuiControlPosY:=55
ReadSettings("GuiControlPosY","ControlGUI","controlGUI.ini",GuiControlPosY)
WriteSettings("GuiControlPosY","ControlGUI","controlGUI.ini",GuiControlPosY)
global GuiControlWidth:=243
ReadSettings("GuiControlWidth","ControlGUI","controlGUI.ini",GuiControlWidth)
WriteSettings("GuiControlWidth","ControlGUI","controlGUI.ini",GuiControlWidth)
global GuiControlHeight:=780
ReadSettings("GuiControlHeight","ControlGUI","controlGUI.ini",GuiControlHeight)
WriteSettings("GuiControlHeight","ControlGUI","controlGUI.ini",GuiControlHeight)


;---------------
; General
;---------------

global GroupBoxSizeW:=90
ReadSettings("GroupBoxSizeW","ControlGUI","controlGUI.ini",GroupBoxSizeW)
WriteSettings("GroupBoxSizeW","ControlGUI","controlGUI.ini",GroupBoxSizeW)
global GroupBoxSizeH:=50
ReadSettings("GroupBoxSizeH","ControlGUI","controlGUI.ini",GroupBoxSizeH)
WriteSettings("GroupBoxSizeH","ControlGUI","controlGUI.ini",GroupBoxSizeH)


;---------------
; GroupBoxPos And Its ON/OFF
;---------------

;--------
; Switch
;--------
global groupBoxSwitchX:=55
ReadSettings("groupBoxSwitchX","ControlGUI","controlGUI.ini",groupBoxSwitchX)
WriteSettings("groupBoxSwitchX","ControlGUI","controlGUI.ini",groupBoxSwitchX)
global groupBoxSwitchY:=110
ReadSettings("groupBoxSwitchY","ControlGUI","controlGUI.ini",groupBoxSwitchY)
WriteSettings("groupBoxSwitchY","ControlGUI","controlGUI.ini",groupBoxSwitchY)
global SwitchOnOffCustomX:=0
ReadSettings("SwitchOnOffCustomX","ControlGUI","controlGUI.ini",SwitchOnOffCustomX)
WriteSettings("SwitchOnOffCustomX","ControlGUI","controlGUI.ini",SwitchOnOffCustomX)
global SwitchOnOffCustomY:=0
ReadSettings("SwitchOnOffCustomY","ControlGUI","controlGUI.ini",SwitchOnOffCustomY)
WriteSettings("SwitchOnOffCustomY","ControlGUI","controlGUI.ini",SwitchOnOffCustomY)
;--------
; Skip
;--------
global groupBoxSkipX:=5
ReadSettings("groupBoxSkipX","ControlGUI","controlGUI.ini",groupBoxSkipX)
WriteSettings("groupBoxSkipX","ControlGUI","controlGUI.ini",groupBoxSkipX)
global groupBoxSkipY:=170
ReadSettings("groupBoxSkipY","ControlGUI","controlGUI.ini",groupBoxSkipY)
WriteSettings("groupBoxSkipY","ControlGUI","controlGUI.ini",groupBoxSkipY)
global SkipOnOffCustomX:=0
ReadSettings("SkipOnOffCustomX","ControlGUI","controlGUI.ini",SkipOnOffCustomX)
WriteSettings("SkipOnOffCustomX","ControlGUI","controlGUI.ini",SkipOnOffCustomX)
global SkipOnOffCustomY:=0
ReadSettings("SkipOnOffCustomY","ControlGUI","controlGUI.ini",SkipOnOffCustomY)
WriteSettings("SkipOnOffCustomY","ControlGUI","controlGUI.ini",SkipOnOffCustomY)

;--------
; Trade
;--------
global groupBoxTradeX:=105
ReadSettings("groupBoxTradeX","ControlGUI","controlGUI.ini",groupBoxTradeX)
WriteSettings("groupBoxTradeX","ControlGUI","controlGUI.ini",groupBoxTradeX)
global groupBoxTradeY:=170
ReadSettings("groupBoxTradeY","ControlGUI","controlGUI.ini",groupBoxTradeY)
WriteSettings("groupBoxTradeY","ControlGUI","controlGUI.ini",groupBoxTradeY)
global TradeOnOffCustomX:=0
ReadSettings("TradeOnOffCustomX","ControlGUI","controlGUI.ini",TradeOnOffCustomX)
WriteSettings("TradeOnOffCustomX","ControlGUI","controlGUI.ini",TradeOnOffCustomX)
global TradeOnOffCustomY:=0
ReadSettings("TradeOnOffCustomY","ControlGUI","controlGUI.ini",TradeOnOffCustomY)
WriteSettings("TradeOnOffCustomY","ControlGUI","controlGUI.ini",TradeOnOffCustomY)

;--------
; Loot
;--------

global groupBoxLootX:=5
ReadSettings("groupBoxLootX","ControlGUI","controlGUI.ini",groupBoxLootX)
WriteSettings("groupBoxLootX","ControlGUI","controlGUI.ini",groupBoxLootX)
global groupBoxLootY:=230
ReadSettings("groupBoxLootY","ControlGUI","controlGUI.ini",groupBoxLootY)
WriteSettings("groupBoxLootY","ControlGUI","controlGUI.ini",groupBoxLootY)
global LootOnOffCustomX:=0
ReadSettings("LootOnOffCustomX","ControlGUI","controlGUI.ini",LootOnOffCustomX)
WriteSettings("LootOnOffCustomX","ControlGUI","controlGUI.ini",LootOnOffCustomX)
global LootOnOffCustomY:=0
ReadSettings("LootOnOffCustomY","ControlGUI","controlGUI.ini",LootOnOffCustomY)
WriteSettings("LootOnOffCustomY","ControlGUI","controlGUI.ini",LootOnOffCustomY)

;--------
; Chicken Factory Button 
;--------
global groupBoxCFSizeW:=190
ReadSettings("groupBoxCFSizeW","ControlGUI","controlGUI.ini",groupBoxCFSizeW)
WriteSettings("groupBoxCFSizeW","ControlGUI","controlGUI.ini",groupBoxCFSizeW)
global groupBoxCFSizeH:=50
ReadSettings("groupBoxCFSizeH","ControlGUI","controlGUI.ini",groupBoxCFSizeH)
WriteSettings("groupBoxCFSizeH","ControlGUI","controlGUI.ini",groupBoxCFSizeH)
global groupBoxCFX:=5
ReadSettings("groupBoxCFX","ControlGUI","controlGUI.ini",groupBoxCFX)
WriteSettings("groupBoxCFX","ControlGUI","controlGUI.ini",groupBoxCFX)
global groupBoxCFY:=470
ReadSettings("groupBoxCFY","ControlGUI","controlGUI.ini",groupBoxCFY)
WriteSettings("groupBoxCFY","ControlGUI","controlGUI.ini",groupBoxCFY)
global CFX:=0
ReadSettings("CFX","ControlGUI","controlGUI.ini",CFX)
WriteSettings("CFX","ControlGUI","controlGUI.ini",CFX)
global CFY:=-3
ReadSettings("CFY","ControlGUI","controlGUI.ini",CFY)
WriteSettings("CFY","ControlGUI","controlGUI.ini",CFY)

global OpenControlGUIKey:="^w"
ReadSettings("OpenControlGUIKey","ControlGUI","controlGUI.ini",OpenControlGUIKey)
WriteSettings("OpenControlGUIKey","ControlGUI","controlGUI.ini",OpenControlGUIKey)

;--------
; PartyGUI
;--------
global OpenPartyGUIKey:="^x"
ReadSettings("OpenPartyGUIKey","PartyGUI","partyGUI.ini",OpenPartyGUIKey)
WriteSettings("OpenPartyGUIKey","PartyGUI","partyGUI.ini",OpenPartyGUIKey)
global PartyGUIW:=240
ReadSettings("PartyGUIW","PartyGUI","partyGUI.ini",PartyGUIW)
WriteSettings("PartyGUIW","PartyGUI","partyGUI.ini",PartyGUIW)
global PartyGUIH:=780
ReadSettings("PartyGUIH","PartyGUI","partyGUI.ini",PartyGUIH)
WriteSettings("PartyGUIH","PartyGUI","partyGUI.ini",PartyGUIH)
global PartyGUIX:= 1617
ReadSettings("PartyGUIX","PartyGUI","partyGUI.ini",PartyGUIX)
WriteSettings("PartyGUIX","PartyGUI","partyGUI.ini",PartyGUIX)
global PartyGUIY:=55
ReadSettings("PartyGUIY","PartyGUI","partyGUI.ini",PartyGUIY)
WriteSettings("PartyGUIY","PartyGUI","partyGUI.ini",PartyGUIY)


global PartyGUIBackgroundColor :="0b1013"
ReadSettings("PartyGUIBackgroundColor","PartyGUI","partyGUI.ini",PartyGUIBackgroundColor)
WriteSettings("PartyGUIBackgroundColor","PartyGUI","partyGUI.ini",PartyGUIBackgroundColor)
global PartyGUINameFont:="Candara"
ReadSettings("PartyGUINameFont","PartyGUI","partyGUI.ini",PartyGUINameFont)
WriteSettings("PartyGUINameFont","PartyGUI","partyGUI.ini",PartyGUINameFont)
global PartyGUINameFontSize:="15"
ReadSettings("PartyGUINameFontSize","PartyGUI","partyGUI.ini",PartyGUINameFontSize)
WriteSettings("PartyGUINameFontSize","PartyGUI","partyGUI.ini",PartyGUINameFontSize)
global PartyGUINameFontColor:="fbdbba"
ReadSettings("PartyGUINameFontColor","PartyGUI","partyGUI.ini",PartyGUINameFontColor)
WriteSettings("PartyGUINameFontColor","PartyGUI","partyGUI.ini",PartyGUINameFontColor)
global PartyGUIButtonFontSize:="12"
ReadSettings("PartyGUIButtonFontSize","PartyGUI","partyGUI.ini",PartyGUIButtonFontSize)
WriteSettings("PartyGUIButtonFontSize","PartyGUI","partyGUI.ini",PartyGUIButtonFontSize)
global PartyGUICurrentPlayerColor:="65bfe0"
ReadSettings("PartyGUICurrentPlayerColor","PartyGUI","partyGUI.ini",PartyGUICurrentPlayerColor)
WriteSettings("PartyGUICurrentPlayerColor","PartyGUI","partyGUI.ini",PartyGUICurrentPlayerColor)
global PartyGUIPlayerDisableColor:="red"
ReadSettings("PartyGUIPlayerDisableColor","PartyGUI","partyGUI.ini",PartyGUIPlayerDisableColor)
WriteSettings("PartyGUIPlayerDisableColor","PartyGUI","partyGUI.ini",PartyGUIPlayerDisableColor)

global PartyGUIPlayerSkipColor:="fbdbba"
ReadSettings("PartyGUIPlayerSkipColor","PartyGUI","partyGUI.ini",PartyGUIPlayerSkipColor)
WriteSettings("PartyGUIPlayerSkipColor","PartyGUI","partyGUI.ini",PartyGUIPlayerSkipColor)




global PartyGUIOpenSizeW:="60"
ReadSettings("PartyGUIOpenSizeW","PartyGUI","partyGUI.ini",PartyGUIOpenSizeW)
WriteSettings("PartyGUIOpenSizeW","PartyGUI","partyGUI.ini",PartyGUIOpenSizeW)
global PartyGUIOpenSizeH:="20"
ReadSettings("PartyGUIOpenSizeH","PartyGUI","partyGUI.ini",PartyGUIOpenSizeH)
WriteSettings("PartyGUIOpenSizeH","PartyGUI","partyGUI.ini",PartyGUIOpenSizeH)

global PartyGUIDisableSizeW:="70"
ReadSettings("PartyGUIDisableSizeW","PartyGUI","partyGUI.ini",PartyGUIDisableSizeW)
WriteSettings("PartyGUIDisableSizeW","PartyGUI","partyGUI.ini",PartyGUIDisableSizeW)
global PartyGUIDisableSizeH:="20"
ReadSettings("PartyGUIDisableSizeH","PartyGUI","partyGUI.ini",PartyGUIDisableSizeH)
WriteSettings("PartyGUIDisableSizeH","PartyGUI","partyGUI.ini",PartyGUIDisableSizeH)

global PartyGUISkipSizeW:="70"
ReadSettings("PartyGUISkipSizeW","PartyGUI","partyGUI.ini",PartyGUISkipSizeW)
WriteSettings("PartyGUISkipSizeW","PartyGUI","partyGUI.ini",PartyGUISkipSizeW)
global PartyGUISkipSizeH:="20"
ReadSettings("PartyGUISkipSizeH","PartyGUI","partyGUI.ini",PartyGUISkipSizeH)
WriteSettings("PartyGUISkipSizeH","PartyGUI","partyGUI.ini",PartyGUISkipSizeH)

global NameStartY := 110
ReadSettings("NameStartY","PartyGUI","partyGUI.ini",NameStartY)
WriteSettings("NameStartY","PartyGUI","partyGUI.ini",NameStartY)
global NameStartX := 30
ReadSettings("NameStartX","PartyGUI","partyGUI.ini",NameStartX)
WriteSettings("NameStartX","PartyGUI","partyGUI.ini",NameStartX)
global buttonStartX:= 25
ReadSettings("buttonStartX","PartyGUI","partyGUI.ini",buttonStartX)
WriteSettings("buttonStartX","PartyGUI","partyGUI.ini",buttonStartX)

global distanceBetweenButtonOpenDisableX:=60
ReadSettings("distanceBetweenButtonOpenDisableX","PartyGUI","partyGUI.ini",distanceBetweenButtonOpenDisableX)
WriteSettings("distanceBetweenButtonOpenDisableX","PartyGUI","partyGUI.ini",distanceBetweenButtonOpenDisableX)
global distanceBetweenButtonDisableSkipX:=71
ReadSettings("distanceBetweenButtonDisableSkipX","PartyGUI","partyGUI.ini",distanceBetweenButtonDisableSkipX)
WriteSettings("distanceBetweenButtonDisableSkipX","PartyGUI","partyGUI.ini",distanceBetweenButtonDisableSkipX)
global distanceBetweenNameAndButtonY:= 30
ReadSettings("distanceBetweenNameAndButtonY","PartyGUI","partyGUI.ini",distanceBetweenNameAndButtonY)
WriteSettings("distanceBetweenNameAndButtonY","PartyGUI","partyGUI.ini",distanceBetweenNameAndButtonY)
global distanceBetweenEachCharacterAndButton:= 70
ReadSettings("distanceBetweenEachCharacterAndButton","PartyGUI","partyGUI.ini",distanceBetweenEachCharacterAndButton)
WriteSettings("distanceBetweenEachCharacterAndButton","PartyGUI","partyGUI.ini",distanceBetweenEachCharacterAndButton)

global charIndicatorImgX:=2
ReadSettings("charIndicatorImgX","PartyGUI","partyGUI.ini",charIndicatorImgX)
WriteSettings("charIndicatorImgX","PartyGUI","partyGUI.ini",charIndicatorImgX)
global charIndicatorImgY:=-30
ReadSettings("charIndicatorImgY","PartyGUI","partyGUI.ini",charIndicatorImgY)
WriteSettings("charIndicatorImgY","PartyGUI","partyGUI.ini",charIndicatorImgY)


global KeyList := "Shift|Ctrl|Alt"
;------------------------
; Bool Switch
;------------------------
global boolSwitch :=false
global boolEchange := false
global atleastOneDisabled := false
global getPidOnce := false
global boolSkip := false
global boolPage1 := true

global boolChangeMap:= true

global nightmode := false
global redfilter := false

global BoolLoot:=false
global boolInFight := false
global boolWasInFight := false
global boolInTrade:=false
global boolEmptyBank:= false
global LastImageFoundTrade:=""
global LastImageFound:=""
global boolSolo:=false
global charPID := 0

global boolSyncDone:=false
global SyncCount := 1
global SyncFirstChar
global SyncFirstCharSave
global SortedNicknames := array()

global countSwitchTab:= 0
global countDofusToLog := 0
global boolLogin:= false


ReadSettings("jesuisunpoulet","Chicken","settings.ini",1)
WriteSettings("jesuisunpoulet","Chicken","settings.ini",1)
if(jesuisunpoulet==0){
	FileAppend,`n,settings.ini
}


If FileExist(A_WorkingDir . "\accounts.txt"){
     Loop, Read, accounts.txt
{
   RegisterAccountToFile(A_LoopReadLine)
}
}
 else {
	FileAppend,, accounts.txt
}


If FileExist(A_WorkingDir . "\teams.ini"){
     Loop, Read, teams.ini
{
	If InStr(A_LoopReadLine, "["){
		team.push(A_LoopReadLine)
	}
 
   }
} else {
	FileAppend,, teams.ini

}


If !FileExist(A_WorkingDir . "\pairing.ini"){

	FileAppend,,pairing.ini
}


;-------------------------------------------------------
; GUI
;-------------------------------------------------------
Gui,Color, 0b1013
Gui,Font, s14 cfbdbba, Candara
Gui, Add, Tab3, % "x"10 " y"10 " w"TABsizeW+8 " h"TABsizeH , Infos|Auto|Auto 2|alguma coisa|Settings|Control GUI|Party GUI|Donation
startX := 40
startY := 220

;-------------------------------------------------------
;
;
; TAB 1 INFOS
;
;
;-------------------------------------------------------


Gui, Tab, 1
Gui, Add, Text, % " x"startX+350 " y"startY-150  " h"30 " vText5", YOUR ACCOUNTS
startY := startY+20
Gui, Add, ListView,% " x"startX+120 " y"startY-110 " h"190 " w"400 " Backgrounde0b1013" "r"10  " -List"  " Checked"  "c191613"  " vlistview1" " -E0x200" ,

startX := 80
startY = 100
count := 1


startX := 32
startY := 70
hotkeyWidth  := 90
setPosWidth := 95

OneSetting:=140
TwoSettings:=240
ThreeSettings:=350
FourSettings:=460
EightSettings:= 850


Gui,Font, s14 cfbdbba, Candara
startY := startY +110


;-------------------------------------------------------
;
;
; TAB 2 
;
;
;-------------------------------------------------------

Gui, Tab, 2

startX := 32
startY := 70
hotkeyWidth  := 90
setPosWidth := 95

OneSetting:=140
TwoSettings:=240
ThreeSettings:=350
FourSettings:=460
FiveSettings:=

GroupBoxHeight = 100

Gui, Add, GroupBox,% " x" startX   " y"startY " w"ThreeSettings " h"GroupBoxHeight,% " Pairing   "
startX := startX+20
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vPairingKey", %AutoPairingKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30  " h"25 , Chat Pos
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25 " gCoordinatesChat",(X,Y)
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPairingDelay", %PairingDelay%

startX := 32
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"ThreeSettings " h"210,% " Auto Switch  "
startX := startX+20
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vSwitchKey", %AutoSwitchKey%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,  Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vAutoSwitchDelay", %AutoSwitchDelay%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Screenshot
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25  " gOpenFolderContainingNames", Folder

startX := 32
Gui,Font, s15 cwhite, Candara
gui, add, text, % " x" startX+20 " y"startY+99, ______________________________
Gui,Font, s14 cfbdbba, Candara

startY := startY +110

startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30 " h"25 ,Area containg the name
Gui, Add,Button,% " x" startX   " y"startY+60 " w"95 " h"25 " gCoordinatesNamePos1", (X1,Y1)
startX := startX + 110
Gui, Add,Button,% " x" startX   " y"startY+60 " w"95 " h"25 " gCoordinatesNamePos2", (X2,Y2)
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30  " h"25 , EF.Ind Pos
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25 " gCoordinatesEndFightIndicator1", (X,Y)
startX := startX + 110
startX := 32
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"ThreeSettings " h"GroupBoxHeight,% " Skip   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Toggle Key
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vSkip", %AutoSkipKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Skip Key
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vSkipKey", %SkipKey%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vSkipDelay", %ReadyDelay%

startX := 32
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"ThreeSettings " h"100,% " Ready   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vReadyKey", %AutoReadyKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30  " h"25 , Button Pos
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25 " gCoordinatesReady", (X,Y)
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vReadyDelay", %ReadyDelay%




startX := 392
startY := 70
hotkeyWidth  := 90
setPosWidth := 95


Gui, Add, GroupBox,% " x" startX   " y"startY " w"TwoSettings " h"100, % " Switch Tab   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Previous
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vPreviousTab", %PreviousTabKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30, Next
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vNextTab", %NextTabKey% 

startX := 392
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"TwoSettings " h"100, % " Move   "
startX := startX+20
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vMoveKey", %AutoMoveKey%
startX := startX + 110
Gui, Add, Text,% " x" startX   " y"startY+30  "h" 30, Delay (ms)
Gui, Add, Edit, % " x" startX   " y"startY+60 " w"90 " h"25 " vMoveDelay" " cblack", %MoveDelay%
startX := 392
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"TwoSettings " h"100, % " Multifunction Click   "
startX := startX+20
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vClickKey", %AutoClickKey%
startX := startX + 110
Gui, Add, Text,% " x" startX   " y"startY+30 "h" 30, Delay (ms)
Gui, Add, Edit, % " x" startX   " y"startY+60 " w"95 " h"25 " vClickDelay" " cblack", %ClickDelay%
startX := 392
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"TwoSettings " h"100, % " Invite   "
startX := startX+20
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vInviteKey", %AutoInviteKey%
startX := startX + 110
Gui, Add, Text,% " x" startX   " y"startY+30  "h" 30, Delay (ms)
Gui, Add, Edit, % " x" startX   " y"startY+60 " w"95 " h"25 " vInviteDelay" " cblack", %InviteDelay%
startX := 392
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"TwoSettings " h"100, % " Join   "
startX := startX+20
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vJoinKey", %AutoJoinKey%
startX := startX + 110
Gui, Add, Text,% " x" startX   " y"startY+30  "h" 30, Delay (ms)
Gui, Add, Edit, % " x" startX   " y"startY+60 " w"90 " h"25 " vJoinDelay" " cblack", %JoinDelay%
startX := startX + 120


startX := 643
startY := 70
hotkeyWidth  := 90
setPosWidth := 95



startX := 643

startX := startX+25

startX := 643

Gui, Add, GroupBox,% " x" startX   " y"startY " w"TwoSettings " h"100, % " CtrlClick    "
startX := startX+25
Gui, Add, Text,% " x" startX   " y"startY+30  "h" 30, Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vCtrlClickKey", %AutoCtrlClick%
startX := startX + 110
Gui, Add, Text,% " x" startX   " y"startY+30  "h" 90,% "Click"
Gui, Add, Edit, % " x" startX   " y"startY+60  " w"90 " h"25 " vClickCount" " cblack", %ClickCount%
startY := startY +110
startX := 643
Gui, Add, GroupBox,% " x" startX   " y"startY " w"240 " h"100, % " Empty Bank   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vEmptyBankKey", %AutoEmptyBankKey%
startX := startX + 110
Gui, Add, Text,% " x" startX   " y"startY+30  "h" 30, Delay (ms)
Gui, Add, Edit, % " x" startX   " y"startY+60 " w"90 " h"25 " vEmptyBankDelay" " cblack", %EmptyBankDelay%

startX := 643
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"240 " h"230, % " Change Map   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Left
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vLeftK", %LeftKey%
startX := startX + 110
Gui, Add, Text,% " x" startX   " y"startY+30  "h" 30, Right
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vRightK", %RightKey%
startY := startY +110
startX := 643
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Top
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vTopK", %TopKey%
startX := startX + 110
Gui, Add, Text,% " x" startX   " y"startY+30  "h" 30, Bottom
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vBottomK", %BottomKey%
startX := 263
startX := startX+25
startY := startY +100
startY := startY +110
Gui, Add,Button,% " x" startX   " y"startY+25  " w"95 " h"25 " gOpenSettings", EDIT FILE
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gResetKey", RESET
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gSaveKeys", SAVE


Gui, Add, Picture,% " x" startX+200 " y"startY-100 " vPicture3", %my_picturefile3%	

;-------------------------------------------------------
;
;
; TAB 3
;
;
;-------------------------------------------------------

Gui,Tab,3

startX := 40
startY := 70
hotkeyWidth  := 90
setPosWidth := 95

Gui, Add, GroupBox,% " x" startX   " y"startY " w"threesettings " h"209, % " Trade   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vTradeKey", %AutoTradeKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30  " h"25 , Name Pos
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25 " gCoordinatesTradeNamePos1", (X1,Y1)
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30  " h"25 , Name Pos 2
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25 " gCoordinatesTradeNamePos2", (X2,Y2)
startX := 40
Gui,Font, s15 cwhite, Candara
gui, add, text, % " x" startX+20 " y"startY+99, ______________________________
Gui,Font, s14 cfbdbba, Candara

startY := startY +110

startX := startX+20
Gui, Add, Text, % " x" startX  " y"startY+30  " h"25 , Accept Pos
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25 " gCoordinatesTrade", (X,Y)
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vTradeDelay", %TradeDelay%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Screenshot
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25  " gOpenFolderContainingNamesEchange", Folder


startY := startY +110
startX := 40
Gui, Add, GroupBox,% " x" startX   " y"startY " w"threesettings " h"100, % " Recall Potion   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vPopoRappelKey", %AutoPopoRappelKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30  " h"25 , Rappel Key
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vRappelKey", %PopoRappelKey%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPopoRappelDelay", %PopoRappelDelay%


startY := startY +110
startX := 40

Gui, Add, GroupBox,% " x" startX   " y"startY " w"threesettings " h"100, % " Bontarian Potion   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vPopoBontaKey", %AutoPopoBontaKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Bonta Key
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vBontaKey", %PopoBontaKey%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPopoBontaDelay", %PopoBontaDelay%

startY := startY +110
startX := 40

Gui, Add, GroupBox,% " x" startX   " y"startY " w"threesettings " h"100, % " Brakmarian Potion   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vPopoBrakmarKey", %AutoPopoBrakmarKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Brak Key
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vBrakmarKey", %PopoBrakmarKey%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPopoBrakmarDelay", %PopoBrakmarDelay%


startX := 420
startY := 70
hotkeyWidth  := 90
setPosWidth := 95

Gui, Add, GroupBox,% " x" startX   " y"startY " w"threesettings " h"100, % " No Loot   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vNoLootKey", %AutoNoLootKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30  " h"25 , EF.Ind Pos
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25 " gCoordinatesEndFightIndicator1", (X,Y)
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vNoLootDelay", %NoLootDelay%
startX := 420
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"threesettings " h"100, % " Auto Bread   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vUseBreadKey", %AutoBreadKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30  " h"25 , Bread Pos
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25 " gCoordinatesAutoBread", (X,Y)
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Delay (ms)
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vBreadDelay", %BreadDelay%

startY := startY +110
startX := 420

Gui, Add, GroupBox,% " x" startX   " y"startY " w"foursettings " h"100, % " Custom Message 1 "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vMessage1Key", %AutoMessage1Key%
startX := startX + 110
Gui,Font, s14 cblack Candara
Gui, Add, Edit, % " x" startX  " y"startY+30 " w"foursettings-150 " h"60 " -VScroll" " vCustomTText1", %CustomText1%
Gui,Font, s14 cfbdbba, Candara
startY := startY +110
startX := 420
Gui, Add, GroupBox,% " x" startX   " y"startY " w"foursettings " h"100, % " Custom Message 2 "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vMessage2Key", %AutoMessage2Key%
startX := startX + 110
Gui,Font, s14 cblack Candara
Gui, Add, Edit, % " x" startX  " y"startY+30 " w"foursettings-150 " h"60 " -VScroll" " vCustomTText2",  %CustomText2%
Gui,Font, s14 cfbdbba, Candara

startX := 420
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"foursettings " h"100, % " Custom Message 3 "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Hotkey
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vMessage3Key", %AutoMessage3Key%
startX := startX + 110
Gui,Font, s14 cblack Candara
Gui, Add, Edit, % " x" startX  " y"startY+30 " w"foursettings-150 " h"60 " -VScroll" " vCustomTText3",  %CustomText3%
Gui,Font, s14 cfbdbba, Candara



startX := 263
startX := startX+25
startY := startY +100

Gui, Add,Button,% " x" startX   " y"startY+25  " w"95 " h"25 " gOpenSettings", EDIT FILE
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gResetKey", RESET
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gSaveKeys", SAVE


;-------------------------------------------------------
;
;
; TAB 4 
;
;
;-------------------------------------------------------

Gui, Tab, 4

startX := 40
startY := 70
hotkeyWidth  := 90
setPosWidth := 95

Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Turn Indicator  "
startX := startX+27
Gui, Add,Button,% " x" startX  " y"startY+30 " w"90 " h"25   " gCoordinatesTurnIndicator1", (X1,Y1)
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25   " gCoordinatesTurnIndicator2", (X2,Y2)

startX := startX+130
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Whole Map  "
startX := startX+27

Gui, Add,Button,% " x" startX  " y"startY+30 " w"90 " h"25   " gCoordinatesWholeMap1", (X1,Y1)
Gui, Add,Button,% " x" startX  " y"startY+60 " w"90 " h"25  " gCoordinatesWholeMap2", (X2,Y2)


startX := 263
startX := startX+25
startY := startY +110
startY := startY +110
startY := startY +100
Gui, Add,Button,% " x" startX   " y"startY+25  " w"95 " h"25 " gOpenSettings", EDIT FILE
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gResetKey", RESET
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gSaveKeys", SAVE


;-------------------------------------------------------
;
;
; TAB 5
;
;
;-------------------------------------------------------

gui,tab, 5
startX := 40
startY := 70
hotkeyWidth  := 90
setPosWidth := 95
Gui, Add, GroupBox,% " x" startX   " y"startY " w"TwoSettings " h"100, % "Configurações "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Reload
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vReloadDPF", %ReloadKey%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30, Exit
Gui, Add, Hotkey,% " x" startX  " y"startY+60 " w"90 " h"25 " vExitDPF", %ExitKey% 
startx  := startX+130
Gui, Add, GroupBox,% " x" startX   " y"startY " w"TwoSettings " h"100, % " Random Delay   "
startX := startX+25
Gui, Add, Text, % " x" startX  " y"startY+30 " w"90 " h"25 , Move
Gui, Add, edit,% " x" startX  " y"startY+60 " w"90 " h"25 " vMoveRandomDelay"  " cblack", %MoveRandomDelay%
startX := startX + 110
Gui, Add, Text, % " x" startX  " y"startY+30, Click 
Gui, Add, edit,% " x" startX  " y"startY+60 " w"90 " h"25 " vClickRandomDelay" " cblack", %ClickRandomDelay% 
startX := 40
startY := startY +110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Night Mode"
startX := startX+27
Gui, Add,Text,% " x" startX+5  " y"startY+30  " h"25  , Colored
Gui, Add,Checkbox,% " x" startX+40  " y"startY+60  " h"25 " vNightChest" " gEnableNightChest",



startX := 263
startX := startX+25
startY := startY +130
startY := startY +110
Gui, Add,Button,% " x" startX   " y"startY+25  " w"95 " h"25 " gOpenSettings", EDIT FILE
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gResetKey", RESET
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gSaveKeys", SAVE


;-------------------------------------------------------
;
;
; TAB 6
;
;
;-------------------------------------------------------


gui,tab, 6

startX := 22
startY := 70
hotkeyWidth  := 90
setPosWidth := 95

OneSetting:=140
TwoSettings:=240
ThreeSettings:=350
FourSettings:=460
FiveSettings:=570
SixSettings:=680
SevenSettings:=790
EightSettings:=840

GroupBoxHeight = 100


Gui, Add, GroupBox,% " x" startX   " y"startY " w"EightSettings+40 " h"155,% " ControlGUI + Box Size  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vGuiControlPosX", %GuiControlPosX%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vGuiControlPosY", %GuiControlPosY%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,Width
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vGuiControlWidth", %GuiControlWidth%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,Height
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vGuiControlHeight", %GuiControlHeight%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,Font
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vControlGUIFont",%ControlGUIFont%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,FontSize
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vControlGUIFontSize",%ControlGUIFontSize%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,FontColor
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vControlGUIFontColor",%ControlGUIFontColor%



startX := 22
startX := startX+20
startY := startY +60
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,FontOnColor
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vControlGUIFontOnColor",%ControlGUIFontOnColor%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,FontOffColor
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vControlGUIFontOffColor",%ControlGUIFontOffColor%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,OnOffSize
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vControlGUIFontOnOffSize",%ControlGUIFontOnOffSize%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,BoxSizeW

Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vGroupBoxSizeW",%GroupBoxSizeW%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,BoxSizeH
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vGroupBoxSizeH",%GroupBoxSizeH%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 ,BackgroundColor
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vControlGUIBackgroundColor",%ControlGUIBackgroundColor%
startX := startX + 110

startY:= 230
startX := 22
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"160,% " SwitchBox  "
startX := startX+5
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxSwitchX", %groupBoxSwitchX%
startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxSwitchY", %groupBoxSwitchY%



startX := startX-70
startY := startY +60
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , OnOffX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vSwitchOnOffCustomX", %SwitchOnOffCustomX%

startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , OnOffY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vSwitchOnOffCustomY", %SwitchOnOffCustomY%


startY:= 230
startX := 170

Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"160,% " SkipBox  "
startX := startX+5
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxskipx", %groupBoxskipx%

startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxskipY", %groupBoxskipY%


startX := startX-70
startY := startY +60
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , OnOffX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vskipOnOffCustomX", %skipOnOffCustomX%

startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , OnOffY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vskipOnOffCustomY", %skipOnOffCustomY%

startY:= 230
startX := 318

Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"160,% " TradeBox  "
startX := startX+5
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxTradex", %groupBoxTradex%
startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxTradeY"
, %groupBoxTradeY%


startX := startX-70
startY := startY +60
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , OnOffX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vTradeOnOffCustomX", %TradeOnOffCustomX%

startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , OnOffY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vTradeOnOffCustomY", %TradeOnOffCustomY%




startY:= 230
startX := 466

Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"160,% " LootBox  "
startX := startX+5
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxLootX", %groupBoxLootX%

startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxLootY", %groupBoxLootY%


startX := startX-70
startY := startY +60
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , OnOffX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vLootOnOffCustomX", %LootOnOffCustomX%

startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , OnOffY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vLootOnOffCustomY", %LootOnOffCustomY%

startY:= 230
startX := 614





startY:= 395
startX := 762

Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"220,% " ChickenBox  "
startX := startX+5
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxCFX", %groupBoxCFX%

startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxCFY", %groupBoxCFY%




startX := startX-70
startY := startY +60
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , SizeW
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxCFSizeW", %groupBoxCFSizeW%

startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , SizeH
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vgroupBoxCFSizeH", %groupBoxCFSizeH%


startX := startX-70
startY := startY +60
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , CFX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vCFX", %CFX%

startX := startX + 70
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , CFY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"60 " h"25 " cblack" " vCFY" , %CFY%

startX := 22
startY:=startY+40
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Open Control GUI  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Hotkey
Gui, Add, Hotkey, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vOpenControlKey", %OpenControlGUIKey%

startX := 263
startX := startX+25
startY := startY +55
Gui, Add,Button,% " x" startX   " y"startY+25  " w"95 " h"25 " gOpenGUIFOLDER", FOLDER
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gResetControlGUI", RESET
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gSaveControlGUI", SAVE

gui,tab, 7


startX := 40
startY := 70
hotkeyWidth  := 90
setPosWidth := 95


Gui, Add, GroupBox,% " x" startX   " y"startY " w"EightSettings " h"200,% " Party GUI  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIX", %PartyGUIX%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , PosY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIY", %PartyGUIY%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Width
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIW", %PartyGUIW%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Height
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIH", %PartyGUIH%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Font
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUINameFont", %PartyGUINameFont%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , FontSize
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUINameFontSize", %PartyGUINameFontSize%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , FontColor
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUINameFontColor", %PartyGUINameFontColor%

startX := startX + 110

startX := 40
startX := startX+20
startY := starty+90

Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Current Color
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUICurrentPlayerColor", %PartyGUICurrentPlayerColor%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Disable Color
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIPlayerDisableColor", %PartyGUIPlayerDisableColor%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Skip Color
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIPlayerSkipColor", %PartyGUIPlayerSkipColor%
startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Button FontSize
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIButtonFontSize", %PartyGUIButtonFontSize%

startX := startX + 160
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Background Color
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIBackgroundColor", %PartyGUIBackgroundColor%
startX := startX + 110

startX := 40
startY := starty+110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"twosettings " h"100,% " Open Button  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Width
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIOpenSizeW", %PartyGUIOpenSizeW%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Height
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIOpenSizeH", %PartyGUIOpenSizeH%


startX := startx +120
Gui, Add, GroupBox,% " x" startX   " y"startY " w"twosettings " h"100,% " Disable Button  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Width
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIDisableSizeW", %PartyGUIDisableSizeW%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Height
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUIDisableSizeH", %PartyGUIDisableSizeH%


startX := startx +120
Gui, Add, GroupBox,% " x" startX   " y"startY " w"twosettings " h"100,% " Skip Button  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Width
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUISkipSizeW", %PartyGUISkipSizeW%

startX := startX + 110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Height
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vPartyGUISkipSizeH", %PartyGUISkipSizeH%





startX := 40
startY := starty+110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"twosettings " h"100,% " Name Button  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , StartX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vNameStartX", %NameStartX%

startX := startx +110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , StartY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vNameStartY", %NameStartY%


startX := startx +120
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Button  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , StartX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vbuttonStartX", %buttonStartX%



startX := startx +130
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Open/Disable  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , StartX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vdistanceBetweenButtonOpenDisableX", %distanceBetweenButtonOpenDisableX%



startX := startx +130
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Disable/Skip  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , StartX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vdistanceBetweenButtonDisableSkipX", %distanceBetweenButtonDisableSkipX%


startX := startx +130
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Name/Button  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , StartX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vdistanceBetweenNameAndButtonY", %distanceBetweenNameAndButtonY%


startX := 40
startY := startY+110
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Char/Button  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , StartX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vdistanceBetweenEachCharacterAndButton", %distanceBetweenEachCharacterAndButton%

startX := startx +130
Gui, Add, GroupBox,% " x" startX   " y"startY " w"twosettings " h"100,% " Img Indic.  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , ImgX
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vcharIndicatorImgX", %charIndicatorImgX%

startX := startX+110
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , ImgY
Gui, Add, Edit, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vcharIndicatorImgY", %charIndicatorImgY%

startX := startx +120
Gui, Add, GroupBox,% " x" startX   " y"startY " w"onesetting " h"100,% " Open Party GUI  "
startX := startX+20
Gui, Add, Text, % " x" startX " y"startY+30  " h"25 , Hotkey
Gui, Add, Hotkey, % " x" startX  " y"startY+60 " w"90 " h"25 " cblack" " vOpenPartyKey", %OpenPartyGUIKey%

startX := 263
startX := startX+25
startY := startY+105

Gui, Add,Button,% " x" startX   " y"startY+25  " w"95 " h"25 " gOpenPartyFolder", FOLDER
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gResetPartyGUI", RESET
startX := startX + 110
Gui, Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gSavePartyGUI", SAVE


gui,tab, 8

Gui, Add,Picture,% " x"360 " y"300 " vPic" A_Index, %PicDonate%
Gui, Add, Text, x590 y605, Non c'est ce bouton là ...
Gui, Add, Button, x800 y600 gDonate, Donate
Gui, Show, w%GUIsizeW% h%GUIsizeH%, DPF__cracked_by_rigwild__Mod____by__SpaceCowb0y
 

;-------------------------------------------------------
;
;
; HOOOOOTKEYS 
;
;-------------------------------------------------------

Hotkey IfWinActive, ahk_class AutoHotkeyGUI

Hotkey, %ReloadKey%, myReloadKey
Hotkey, %ExitKey%, myExitKey
Hotkey, %OpenPartyGUIKey%, myOpenPartyKey
Hotkey, %OpenControlGUIKey%, myOpenControlGUIKey

Hotkey IfWinActive,

Hotkey IfWinActive, ahk_exe Dofus*

Hotkey, %OpenPartyGUIKey%, myOpenPartyKey
Hotkey, %OpenControlGUIKey%, myOpenControlGUIKey
Hotkey, %ReloadKey%, myReloadKey
Hotkey, %ExitKey%, myExitKey

Hotkey, %NextTabKey%, mySwitchTabKey
Hotkey, %PreviousTabKey%, myPreviousTabKey

Hotkey, %AutoCtrlClick%, myCtrlClickKey
Hotkey, %AutoJoinKey%, myJoinKey
Hotkey, %AutoClickKey%, myClickKey
Hotkey, %AutoReadyKey%, myReadyKey
Hotkey, %AutoPairingKey%, myIdentifyKey
Hotkey, %AutoInviteKey%, myInviteKey


Hotkey, %AutoSwitchKey%, mySwitchKey  
Hotkey, %AutoSkipKey%, mySkipKey
Hotkey, %AutoMoveKey%, myMoveKey


Hotkey, %OpenPartyGUIKey%, myOpenPartyKey

Hotkey, %AutoTradeKey%, myTradeKey
Hotkey, %AutoNoLootKey%, myLootKey
Hotkey, %AutoPopoRappelKey%, myRappelKey
Hotkey, %AutoPopoBontaKey%, myBontaKey
Hotkey, %AutoPopoBrakmarKey%, myBrakmarKey

Hotkey, %AutoBreadKey%, myBreadKey

Hotkey, %AutoMessage1Key%, myMessage1Key
Hotkey, %AutoMessage2Key%, myMessage2Key
Hotkey, %AutoMessage3Key%, myMessage3Key
Hotkey, %AutoEmptyBankKey%, myEmptyBankKey


Hotkey, %LeftKey%, myLeftKey
Hotkey, %RightKey%, myRightKey
Hotkey, %BottomKey%, myBottomKey
Hotkey, %TopKey%, myTopKey

Hotkey IfWinActive,

return 

EnableNightChest:
GuiControlGet,NightChest

if(NightChest){
	nightmode := true

} else {
nightmode := false	

}

return

EnableRedFilter:
GuiControlGet,RedFilter

if(RedFilter){
	nightmode := true
	RedFilter := true
	mapColor:="0x06818C"
} else {
	nightmode := false
RedFilter := false	
mapColor:="0x0BC8FF"
}

return

EnableAutoSelect:
GuiControlGet,AutoSelect

UpdateSettings("AutoSelect","AutoLogIn","settings.ini",AutoSelect)
return


SaveControlGUI:

Hotkey IfWinActive, ahk_class AutoHotkeyGUI
if(OpenControlGUIKey){
	Hotkey, % OpenControlGUIKey, myOpenControlGUIKey, off
}
Hotkey IfWinActive,

		Hotkey IfWinActive, ahk_exe Dofus*
		if(OpenControlGUIKey){
		Hotkey, % OpenControlGUIKey, myOpenControlGUIKey, off
		}
	
		Hotkey IfWinActive,
Gui,Submit, NoHide
	


GuiControlGet,GuiControlPosX
GuiControlGet,GuiControlPosY
GuiControlGet,GuiControlWidth
	GuiControlGet,GuiControlHeight
GuiControlGet,ControlGUIFont
GuiControlGet,ControlGUIFontSize
GuiControlGet,ControlGUIFontColor
GuiControlGet,ControlGUIFontOnColor
GuiControlGet,ControlGUIFontOffColor
GuiControlGet,ControlGUIFontOnOffSize
GuiControlGet,GroupBoxSizeW
GuiControlGet,GroupBoxSizeH
GuiControlGet,ControlGUIBackgroundColor
GuiControlGet,groupBoxSwitchX
	
GuiControlGet,groupBoxSwitchY
GuiControlGet,SwitchOnOffCustomX
GuiControlGet,SwitchOnOffCustomY
GuiControlGet,groupBoxSkipX
GuiControlGet,groupBoxSkipY
GuiControlGet,SkipOnOffCustomX
GuiControlGet,SkipOnOffCustomY
GuiControlGet,groupBoxTradeX
GuiControlGet,groupBoxTradeY
GuiControlGet,TradeOnOffCustomX
GuiControlGet,TradeOnOffCustomY
GuiControlGet,groupBoxLootX
GuiControlGet,groupBoxLootY
GuiControlGet,LootOnOffCustomX
GuiControlGet,LootOnOffCustomY
GuiControlGet,groupBoxCupiditeX
GuiControlGet,groupBoxCupiditeY
GuiControlGet,LootOnOffCustomX
GuiControlGet,LootOnOffCustomY
GuiControlGet,groupBoxChanceX
GuiControlGet,groupBoxChanceY
GuiControlGet,ChanceOnOffCustomX
GuiControlGet,ChanceOnOffCustomY
GuiControlGet,groupBoxCoffreX
GuiControlGet,groupBoxCoffreY
GuiControlGet,CoffreOnOffCustomX
GuiControlGet,CoffreOnOffCustomY
GuiControlGet,groupBoxCSP1X
GuiControlGet,groupBoxCSP1Y
GuiControlGet,CSP1OnOffCustomX
GuiControlGet,CSP1OnOffCustomY
GuiControlGet,groupBoxCsP2X
GuiControlGet,groupBoxCsP2Y
GuiControlGet,CsP2OnOffCustomX
GuiControlGet,CsP2OnOffCustomY

GuiControlGet,groupBoxCSP3X
GuiControlGet,groupBoxCsP3Y
GuiControlGet,CSP3OnOffCustomX
GuiControlGet,CSP3OnOffCustomY

GuiControlGet,groupBoxCSP4X
GuiControlGet,groupBoxCsP4Y
GuiControlGet,CSP4OnOffCustomX
GuiControlGet,CSP4OnOffCustomY

	GuiControlGet,groupBoxCFSizeW
		GuiControlGet,groupBoxCFSizeH
		GuiControlGet,groupBoxCFX
		GuiControlGet,groupBoxCFY
		GuiControlGet,CFX
		GuiControlGet,CFY

		
	UpdateSettings("GuiControlPosX","ControlGUI","controlGUI.ini",GuiControlPosX)
	UpdateSettings("GuiControlPosY","ControlGUI","controlGUI.ini",GuiControlPosY)
	UpdateSettings("GuiControlWidth","ControlGUI","controlGUI.ini",GuiControlWidth)
	UpdateSettings("GuiControlHeight","ControlGUI","controlGUI.ini",GuiControlHeight)
	UpdateSettings("ControlGUIFont","ControlGUI","controlGUI.ini",ControlGUIFont)
	UpdateSettings("ControlGUIFontSize","ControlGUI","controlGUI.ini",ControlGUIFontSize)
	UpdateSettings("ControlGUIFontColor","ControlGUI","controlGUI.ini",ControlGUIFontColor)

	UpdateSettings("ControlGUIFontOnColor","ControlGUI","controlGUI.ini",ControlGUIFontOnColor)
	UpdateSettings("ControlGUIFontOffColor","ControlGUI","controlGUI.ini",ControlGUIFontOffColor)
	UpdateSettings("ControlGUIFontOnOffSize","ControlGUI","controlGUI.ini",ControlGUIFontOnOffSize)
	

	UpdateSettings("GroupBoxSizeW","ControlGUI","controlGUI.ini",GroupBoxSizeW)
	UpdateSettings("GroupBoxSizeH","ControlGUI","controlGUI.ini",GroupBoxSizeH)
	UpdateSettings("ControlGUIBackgroundColor","ControlGUI","controlGUI.ini",ControlGUIBackgroundColor)
	
	UpdateSettings("groupBoxSwitchX","ControlGUI","controlGUI.ini",groupBoxSwitchX)
	UpdateSettings("groupBoxSwitchY","ControlGUI","controlGUI.ini",groupBoxSwitchY)
	UpdateSettings("SwitchOnOffCustomX","ControlGUI","controlGUI.ini",SwitchOnOffCustomX)
	UpdateSettings("SwitchOnOffCustomY","ControlGUI","controlGUI.ini",SwitchOnOffCustomY)
	
	UpdateSettings("groupBoxSkipX","ControlGUI","controlGUI.ini",groupBoxSkipX)
	UpdateSettings("groupBoxSkipY","ControlGUI","controlGUI.ini",groupBoxSkipY)
	UpdateSettings("SkipOnOffCustomX","ControlGUI","controlGUI.ini",SkipOnOffCustomX)
	UpdateSettings("SkipOnOffCustomY","ControlGUI","controlGUI.ini",SkipOnOffCustomY)
	
	UpdateSettings("groupBoxTradeX","ControlGUI","controlGUI.ini",groupBoxTradeX)
	UpdateSettings("groupBoxTradeY","ControlGUI","controlGUI.ini",groupBoxTradeY)
	UpdateSettings("TradeOnOffCustomX","ControlGUI","controlGUI.ini",TradeOnOffCustomX)
	UpdateSettings("TradeOnOffCustomY","ControlGUI","controlGUI.ini",TradeOnOffCustomY)

	UpdateSettings("groupBoxLootX","ControlGUI","controlGUI.ini",groupBoxLootX)
	UpdateSettings("groupBoxLootY","ControlGUI","controlGUI.ini",groupBoxLootY)
	UpdateSettings("LootOnOffCustomX","ControlGUI","controlGUI.ini",LootOnOffCustomX)
	UpdateSettings("LootOnOffCustomY","ControlGUI","controlGUI.ini",LootOnOffCustomY)
	
	UpdateSettings("groupBoxCupiditeX","ControlGUI","controlGUI.ini",groupBoxCupiditeX)
	UpdateSettings("groupBoxCupiditeY","ControlGUI","controlGUI.ini",groupBoxCupiditeY)
	UpdateSettings("LootOnOffCustomX","ControlGUI","controlGUI.ini",LootOnOffCustomX)
	UpdateSettings("LootOnOffCustomY","ControlGUI","controlGUI.ini",LootOnOffCustomY)
	

	UpdateSettings("groupBoxChanceX","ControlGUI","controlGUI.ini",groupBoxChanceX)
	UpdateSettings("groupBoxChanceY","ControlGUI","controlGUI.ini",groupBoxChanceY)
	UpdateSettings("ChanceOnOffCustomX","ControlGUI","controlGUI.ini",ChanceOnOffCustomX)
	UpdateSettings("ChanceOnOffCustomY","ControlGUI","controlGUI.ini",ChanceOnOffCustomY)
	
	UpdateSettings("groupBoxCoffreX","ControlGUI","controlGUI.ini",groupBoxCoffreX)
	UpdateSettings("groupBoxCoffreY","ControlGUI","controlGUI.ini",groupBoxCoffreY)
	UpdateSettings("CoffreOnOffCustomX","ControlGUI","controlGUI.ini",CoffreOnOffCustomX)
	UpdateSettings("CoffreOnOffCustomY","ControlGUI","controlGUI.ini",CoffreOnOffCustomY)
	
	UpdateSettings("groupBoxCSP1X","ControlGUI","controlGUI.ini",groupBoxCSP1X)
	UpdateSettings("groupBoxCSP1Y","ControlGUI","controlGUI.ini",groupBoxCSP1Y)
	UpdateSettings("CSP1OnOffCustomX","ControlGUI","controlGUI.ini",CSP1OnOffCustomX)
	UpdateSettings("CSP1OnOffCustomY","ControlGUI","controlGUI.ini",CSP1OnOffCustomY)

	UpdateSettings("groupBoxCsP2X","ControlGUI","controlGUI.ini",groupBoxCsP2X)
	UpdateSettings("groupBoxCsP2Y","ControlGUI","controlGUI.ini",groupBoxCsP2Y)
	UpdateSettings("CsP2OnOffCustomX","ControlGUI","controlGUI.ini",CsP2OnOffCustomX)
	UpdateSettings("CsP2OnOffCustomY","ControlGUI","controlGUI.ini",CsP2OnOffCustomY)
	
	UpdateSettings("groupBoxCSP3X","ControlGUI","controlGUI.ini",groupBoxCSP3X)
	UpdateSettings("groupBoxCsP3Y","ControlGUI","controlGUI.ini",groupBoxCsP3Y)
	UpdateSettings("CSP3OnOffCustomX","ControlGUI","controlGUI.ini",CSP3OnOffCustomX)
	UpdateSettings("CSP3OnOffCustomY","ControlGUI","controlGUI.ini",CSP3OnOffCustomY)

	UpdateSettings("groupBoxCSP4X","ControlGUI","controlGUI.ini",groupBoxCSP4X)
	UpdateSettings("groupBoxCsP4Y","ControlGUI","controlGUI.ini",groupBoxCsP4Y)
	UpdateSettings("CSP4OnOffCustomX","ControlGUI","controlGUI.ini",CSP4OnOffCustomX)
	UpdateSettings("CSP4OnOffCustomY","ControlGUI","controlGUI.ini",CSP4OnOffCustomY)
	
		
	UpdateSettings("groupBoxCFSizeW","ControlGUI","controlGUI.ini",groupBoxCFSizeW)
	UpdateSettings("groupBoxCFSizeH","ControlGUI","controlGUI.ini",groupBoxCFSizeH)
	UpdateSettings("groupBoxCFX","ControlGUI","controlGUI.ini",groupBoxCFX)
	UpdateSettings("groupBoxCFY","ControlGUI","controlGUI.ini",groupBoxCFY)
	UpdateSettings("CFX","ControlGUI","controlGUI.ini",CFX)
	UpdateSettings("CFY","ControlGUI","controlGUI.ini",CFY)
	

	if(OpenControlKey){
		UpdateSettings("OpenControlGUIKey","ControlGUI","ControlGUI.ini",OpenControlKey)
		Hotkey IfWinActive, ahk_class AutoHotkeyGUI
		if(OpenControlGUIKey){
			Hotkey, %OpenControlGUIKey%, myOpenControlGUIKey, on
		}
		
		
Hotkey IfWinActive,

		Hotkey IfWinActive, ahk_exe Dofus*
			Hotkey, % OpenControlGUIKey, myOpenControlGUIKey, on
		Hotkey IfWinActive,
	  
	  
			  MsgBox,, HEY BABE, SAVING ... , 0.5
	} else {
	MsgBox % "OpenControlGUIKey is empty"
}
	
	

	Gui,6:Destroy
	gosub Controlgui
return

StayOnTopCheckbox:
Gui,Submit, NoHide
if(StayOnTop){
	Gui, +AlwaysOnTop
} else {
	Gui, -AlwaysOnTop
}
return


checkall:
Gui, ListView, listview1
LV_Modify(0, "Check")
return


uncheckall:
Gui, ListView, listview1
LV_Modify("", "-Check") 
Gui, ListView, listview2
LV_Modify("", "-Check") 
return

EnableChestCheckbox:
Gui,Submit, NoHide
if(boolEnableChest){
	EnableChest := true
		IniWrite, 1, settings.ini, AutoBuff,EnableChest
} else {
 EnableChest := false 
 IniWrite, 0, settings.ini, AutoBuff,EnableChest
}


	ifWinExist,PARTY
Gui 2: Destroy
	goto, PartyGUI

return



EnableCupiditeCheckbox:
Gui,Submit, NoHide
if(boolEnableCupidite){
	EnableCupidite := true
		IniWrite, 1, settings.ini, AutoBuff,EnableCupidite
} else {
 EnableCupidite := false 
 IniWrite, 0, settings.ini, AutoBuff,EnableCupidite
}

	ifWinExist,PARTY
Gui 2: Destroy
	goto, PartyGUI
	
return

EnableChanceCheckbox:
Gui,Submit, NoHide
if(boolEnableChance){
	EnableChance := true
		IniWrite, 1, settings.ini, AutoBuff,EnableChance
} else {
   EnableChance := false
   	IniWrite, 0, settings.ini, AutoBuff,EnableChance
}


	ifWinExist,PARTY
Gui 2: Destroy
	goto, PartyGUI
	

return


;-------------------------------------------------------
;
;
; PARTY GUI
;
;
;-------------------------------------------------------

; initiative

PartyGUI:
readPartySettings()
If(!isArrayEmpty(Nicknames)){
buttonStartXTemp := buttonStartX
Gui 2:Color, %PartyGUIBackgroundColor%
Gui 2:Font, bold
Gui 2:+AlwaysOnTop


for key,val in Nicknames {
Gui 2:Font,  s%PartyGUINameFontSize% c%PartyGUINameFontColor%, %PartyGUINameFont%

buttonStartX:= buttonStartXTemp
Gui 2: Add, Text, % " x"NameStartX " y"NameStartY  " vChar"A_Index, % val.name "                       "

buttonStartY:= NameStartY + distanceBetweenNameAndButtonY
Gui 2:Font,  s%PartyGUIButtonFontSize%


Gui 2: Add,Picture,% " x"charIndicatorImgX " y"charIndicatorImgY+ buttonStartY " vPic" A_Index, %Pic2%

buttonStartX:=buttonStartX
Gui 2: Add, Button, % " x"buttonStartX " y"buttonStartY " h"PartyGUIOpenSizeH " w"PartyGUIOpenSizeW " gOpen",OPEN 

nameSkip:= val.name
IniRead,booSkip,charManager.ini,SKIP,%nameSkip%
buttonStartX:=distanceBetweenButtonOpenDisableX+buttonStartX

Gui 2: Add, Button, % " x"buttonStartX " y"buttonStartY " h"PartyGUIDisableSizeH " w"PartyGUIDisableSizeW   " gDisable" " vButton" A_Index  ,DISABLE

buttonStartX:=distanceBetweenButtonDisableSkipX+buttonStartX
if(booSkip=="true"){
	Gui 2: Add, Button, % " x"buttonStartX-1 " y"buttonStartY " h"PartyGUISkipSizeH " w"PartyGUISkipSizeW   " gSkip" " vSkipping" A_Index  ,UNSKIP
	skippingArray[val.name] := true 
	
} else {
	Gui 2: Add, Button, % " x"buttonStartX-1 " y"buttonStartY " h"PartyGUISkipSizeH " w"PartyGUISkipSizeW   " gSkip" " vSkipping" A_Index  ,SKIP
	skippingArray[val.name] := false
}

nameStartY := nameStartY + distanceBetweenEachCharacterAndButton
ColorActiveChar()
}

Gui 2:-Caption
Gui 2:Show,% " x"PartyGUIX " y"PartyGUIY " w"PartyGUIW " h"PartyGUIH " NoActivate",PARTY
OnMessage(0x0201, "WM_LBUTTONDOWN")

}



Hotkey IfWinActive, ahk_exe Dofus*
for key, val in Nicknames {
		
myCharName := val.pid
IniRead,SwitchCharKey%myCharName%,charManager.ini,Characters,% val.name
IniRead,BeepChar%A_Index%,charManager.ini,Beep,% val.name
IniRead,LootChar%A_Index%,charManager.ini,Loot,% val.name
IniRead,CupiditeChar%A_Index%,charManager.ini,Cupidite,% val.name
IniRead,ChanceChar%A_Index%,charManager.ini,Chance,% val.name
IniRead,CoffreChar%A_Index%,charManager.ini,Chest,% val.name
IniRead,CSP1Char%A_Index%,charManager.ini,CSP1,% val.name
IniRead,CSP2Char%A_Index%,charManager.ini,CSP2,% val.name
IniRead,CSP3Char%A_Index%,charManager.ini,CSP3,% val.name
IniRead,CSP4Char%A_Index%,charManager.ini,CSP4,% val.name
key := SwitchCharKey%myCharName%

beepArray[val.name]:= BeepChar%A_Index%


LootArray[val.name]:= LootChar%A_Index%
CupiditeArray[val.name]:= new Buff(CupiditeChar%A_Index%,0)
ChanceArray[val.name]:=new Buff( ChanceChar%A_Index%,0)
ChestArray[val.name]:= new Buff(CoffreChar%A_Index%,0)

CSP1Array[val.name]:= new Buff(CSP1Char%A_Index%,0)
CSP2Array[val.name]:= new Buff(CSP2Char%A_Index%,0)
CSP3Array[val.name]:= new Buff(CSP3Char%A_Index%,0)
CSP4Array[val.name]:= new Buff(CSP4Char%A_Index%,0)

if(key!="ERROR" && key!=""){
	Hotkey, % SwitchCharKey%myCharName%, myChickenKey	
	}

}Hotkey IfWinActive,

Gui,6:Destroy
gosub controlgui

return



Open:
Gui 2:Submit, NoHide
CoordMode, Mouse, Relative
MouseGetPos, Bx,By


counter := 1

for key,val in Nicknames {
ControlGetPos, x, y, w, h,% "Button" counter

If( By > y && By< y+24){
WinActivate, % "ahk_pid" val.pid
ColorActiveChar()
	
	return
} 
counter := counter + 3


}

return


Disable:
Gui 2:Submit, NoHide
CoordMode, Mouse, Relative
MouseGetPos, Bx,By
counter := 2
for key,val in Nicknames {
ControlGetPos, x, y, w, h,% "Button" counter
If( By >= y && By<=y+24){
	GuiControlGet, var,, % A_GuiControl
	if(var == "DISABLE"){
	disabledChar[val.name] := true 
	GuiControl,2:,% "Button" A_Index ,ENABLE
	disabledCharCount++
	} else {
	GuiControl,2:,% "Button" A_Index ,DISABLE
	disabledChar[val.name] := false 
	disabledCharCount--
	}

    ColorActiveChar()

	return
}
counter := counter + 3

}
return


Skip:
Gui 2:Submit, NoHide
CoordMode, Mouse, Relative
MouseGetPos, Bx,By

counter := 3
for key,val in Nicknames {
ControlGetPos, x, y, w, h,% "Button" counter

If( By > y && By< y+24){
	GuiControlGet, var,, % A_GuiControl
	if(var == "SKIP"){
	skippingArray[val.name] := true 
	GuiControl,2:,% "Skipping" A_Index ,UNSKIP
	IniWrite,true,charManager.ini,SKIP, % val.name
	} else {
	GuiControl,2:,% "Skipping" A_Index ,SKIP
	IniWrite,false,charManager.ini,SKIP,% val.name
	skippingArray[val.name] := false 
	}
	
	WinActivate, ahk_exe Dofus*
	return
} 
counter := counter + 3

}
return

ColorActiveChar(){
starty:= 0
WinGet, currentPID, PID, A

for key,val in Nicknames{	
Gui 2:Font, s%PartyGUINameFontSize% c%PartyGUINameFontColor%, s%PartyGUINameFontSize%

	if(SkippingArray[val.name] == true){
			Gui 2:Font, s%PartyGUINameFontSize% c%PartyGUIPlayerSkipColor%, s%PartyGUINameFontSize%
			GuiControl,2: Font,% "Char" A_Index	
	
	}

	if(disabledChar[val.name] == true){
			Gui 2:Font, s%PartyGUINameFontSize% c%PartyGUIPlayerDisableColor%, s%PartyGUINameFontSize%
			GuiControl,2: Font,% "Char" A_Index	
			Gui 2:Font, s%PartyGUINameFontSize% c%PartyGUINameFontColor%, s%PartyGUINameFontSize%
	} 
	
	else {
			GuiControl,2: Font,% "Char" A_Index	
	GuiControl,2: Text,% "Char" A_Index,%  val.name
	GuiControl,2: Hide,% "Pic" A_Index
}

	if(currentPID == val.pid && disabledChar[val.name] != true){	
	Gui 2:Font, s%PartyGUINameFontSize% c%PartyGUICurrentPlayerColor%, %PartyGUINameFont%
	GuiControl,2: Font,% "Char" A_Index
	GuiControl,2: Show,% "Pic" A_Index
	}
	
}
}




WM_LBUTTONDOWN()
{
   If (A_Gui)
      PostMessage, 0xA1, 2
}


;-------------------------------------------------------
;
;
; SAVE AND RESET KEYS
;
;
;-------------------------------------------------------


checkIfKeyEmpty(key,name){
	if(key==""){
		
		MsgBox, 262160,Open your eyes you ain't chinese are you ? , % name " is empty"
			return true
	}

}


SaveKeys:	
	Hotkey IfWinActive, ahk_class AutoHotkeyGUI
	Hotkey, %ReloadKey%, myReloadKey, off
	Hotkey, %ExitKey%, myExitKey,  off
	Hotkey IfWinActive,

	Hotkey IfWinActive, ahk_exe Dofus*
	Hotkey,% NextTabKey, mySwitchTabKey, Off
	Hotkey,% PreviousTabKey, myPreviousTabKey, Off

	Hotkey,% AutoJoinKey, myJoinKey, Off
	Hotkey,% AutoClickKey, myClickKey, Off
	Hotkey,% AutoReadyKey, myReadyKey, Off
	Hotkey,% AutoInviteKey, myInviteKey, Off
	Hotkey,% AutoSwitchKey, mySwitchKey, Off
	Hotkey,% AutoPairingKey, myIdentifyKey, Off
	Hotkey,% AutoMoveKey, myMoveKey, Off
	Hotkey,% ReloadKey, myReloadKey, Off
	Hotkey,% ExitKey, myExitKey, Off
	Hotkey,% AutoSkipKey, mySkipKey, Off
	Hotkey,% AutoCtrlClick, myCtrlClickKey, Off
	Hotkey,% AutoChanceKey, myChanceKey, Off
	Hotkey,% AutoCupiditeKey, myCupiditeKey, Off
	Hotkey,% AutoChestKey, myChestKey, Off
	Hotkey,% AutoTradeKey, myTradeKey, Off
	Hotkey,% AutoNoLootKey, myLootKey, Off
	Hotkey,% AutoPopoRappelKey, myRappelKey, Off	
	Hotkey,% AutoPopoBontaKey, myBontaKey, Off
	Hotkey,% AutoPopoBrakmarKey, myBrakmarKey, Off
	Hotkey,% AutoEmptyBankKey, myEmptyBankKey, Off
	

	Hotkey,% AutoBreadKey, myBreadKey, Off
	
	Hotkey,% AutoMessage1Key, myMessage1Key, Off
	Hotkey,% AutoMessage2Key, myMessage2Key, Off
	Hotkey,% AutoMessage3Key, myMessage3Key, Off
	
	Hotkey, %AutoCSP1Key%, myCSP1Key, Off
	Hotkey, %AutoCSP2Key%, myCSP2Key, Off
	Hotkey, %AutoCSP3Key%, myCSP3Key, Off
	Hotkey, %AutoCSP4Key%, myCSP4Key, Off


Hotkey, %LeftKey%, myLeftKey, Off
Hotkey, %RightKey%, myRightKey, Off
Hotkey, %BottomKey%, myBottomKey, Off
Hotkey, %TopKey%, myTopKey, Off

Hotkey IfWinActive,


    Gui, Submit, NoHide
	
	emptyField := false
	if(checkIfKeyEmpty(NextTab,"NextTabKey")){
		emptyField := true
	}
	
	if(checkIfKeyEmpty(PreviousTab,"PreviousTabKey")){
		emptyField := true
	}
	
	if(checkIfKeyEmpty(JoinKey,"AutoJoinKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(ClickKey,"AutoClickKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(SwitchKey,"AutoSwitchKey")){
		emptyField := true
	}if(checkIfKeyEmpty(ReadyKey,"AutoReadyKey")){
		emptyField := true
	}

	if(checkIfKeyEmpty(InviteKey,"AutoInviteKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(SwitchKey,"AutoSwitchKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(PairingKey,"AutoPairingKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(MoveKey,"AutoMoveKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(ReloadDPF,"ReloadKey")){
		emptyField := true
	}
		if(checkIfKeyEmpty(ExitDPF,"ExitKey")){
		emptyField := true
	}
	
	if(checkIfKeyEmpty(Skip,"AutoSkipKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(CtrlClickKey,"AutoCtrlClick")){
		emptyField := true
	}if(checkIfKeyEmpty(TradeKey,"AutoTradeKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(NoLootKey,"AutoNoLootKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(PopoBontaKey,"AutoPopoBontaKey")){
		emptyField := true
	}

	if(checkIfKeyEmpty(PopoRappelKey,"AutoPopoRappelKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(PopoBrakmarKey,"AutoPopoBrakmarKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(EmptyBankKey,"AutoEmptyBankKey")){
		emptyField := true
	}
	
	if(checkIfKeyEmpty(UseBreadKey,"AutoBreadKey")){
		emptyField := true
	}
	
	if(checkIfKeyEmpty(Message1Key,"AutoMessage1Key")){
		emptyField := true
	}
	
	if(checkIfKeyEmpty(Message2Key,"AutoMessage2Key")){
		emptyField := true
	}
	
	if(checkIfKeyEmpty(Message3Key,"AutoMessage3Key")){
		emptyField := true
	}
	
	if(checkIfKeyEmpty(LeftK,"LeftKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(RightK,"RightKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(TopK,"TopKey")){
		emptyField := true
	}
	if(checkIfKeyEmpty(BottomK,"BottomKey")){
		emptyField := true
	}
	
	if(!emptyField){
		
		
		UpdateSettings("ReloadKey","GUI","settings.ini",ReloadDPF)
		UpdateSettings("ExitKey","GUI","settings.ini",ExitDPF)
		UpdateSettings("NextTabKey","WindowsManager","settings.ini",NextTab)
		UpdateSettings("PreviousTabKey","WindowsManager","settings.ini",PreviousTab)
		
		UpdateSettings("openPartyKey","GUI","settings.ini",openPartyKey)
	 	UpdateSettings("openHelpKey","GUI","settings.ini",openHelpKey)
		
		UpdateSettings("AutoLogInDelay","AutoLogIn","settings.ini",AutoLogInDelay)
		UpdateSettings("startDofusDelay","AutoLogIn","settings.ini",startDofusDelay)
		UpdateSettings("DelayClickAfterLoadingScreen","AutoLogIn","settings.ini",DelayClickAfterLoadingScreen)
	
		UpdateSettings("AutoLogInDelayBetweenLogAndServer","AutoLogIn","settings.ini",AutoLogInDelayBetweenLogAndServer)
		UpdateSettings("AutoLogInDelayBetweenServerAndCharacter","AutoLogIn","settings.ini",AutoLogInDelayBetweenServerAndCharacter)

		UpdateSettings("AutoPairingKey","Pairing","settings.ini",PairingKey)
		UpdateSettings("PairingDelay","Pairing","settings.ini",PairingDelay)
		
		
		UpdateSettings("AutoSwitchKey","AutoSwitch","settings.ini",SwitchKey)
		UpdateSettings("AutoSwitchDelay","AutoSwitch","settings.ini",AutoSwitchDelay)

		
		UpdateSettings("AutoReadyKey","AutoReady","settings.ini",ReadyKey)
		
		UpdateSettings("ReadyDelay","AutoReady","settings.ini",ReadyDelay)
		UpdateSettings("AutoJoinKey","AutoJoin","settings.ini",JoinKey)
		UpdateSettings("JoinDelay","AutoJoin","settings.ini",JoinDelay)
		UpdateSettings("AutoClickKey","AutoClick","settings.ini",ClickKey)
		UpdateSettings("ClickDelay","AutoClick","settings.ini",ClickDelay)
		UpdateSettings("ClickRandomDelay","AutoClick","settings.ini",ClickRandomDelay)
		UpdateSettings("AutoInviteKey","AutoInvite","settings.ini",InviteKey)
		UpdateSettings("InviteDelay","AutoInvite","settings.ini",InviteDelay)
		UpdateSettings("AutoMoveKey","AutoMove","settings.ini",MoveKey)
		UpdateSettings("MoveDelay","AutoMove","settings.ini",MoveDelay)
		UpdateSettings("MoveRandomDelay","AutoMove","settings.ini",MoveRandomDelay)
		
		UpdateSettings("AutoSkipKey","AutoSkipKey","settings.ini",AutoSkipKey)
		
		UpdateSettings("SkipDelay","AutoSkipKey","settings.ini",SkipDelay)
		UpdateSettings("SkipKey","AutoSkipKey","settings.ini",SkipKey)
		UpdateSettings("AutoCtrlClick","AutoCtrlClick","settings.ini",CtrlClickKey)
		UpdateSettings("ClickCount","AutoCtrlClick","settings.ini",ClickCount)
		UpdateSettings("AutoNoLootKey","AutoNoLoot","settings.ini",NoLootKey)
		UpdateSettings("NoLootDelay","AutoNoLoot","settings.ini",NoLootDelay)
		
		UpdateSettings("AutoEmptyBankKey","AutoEmptyBank","settings.ini",EmptyBankKey)
		UpdateSettings("EmptyBankDelay","AutoEmptyBank","settings.ini",EmptyBankDelay)
		UpdateSettings("AutoPopoRappelKey","AutoPopoRappel","settings.ini",PopoRappelKey)
		UpdateSettings("PopoRappelKey","AutoPopoRappel","settings.ini",RappelKey)
		UpdateSettings("PopoRappelDelay","AutoPopoRappel","settings.ini",PopoRappelDelay)
		
		UpdateSettings("AutoPopoBontaKey","AutoPopoBonta","settings.ini",PopoBontaKey)
		UpdateSettings("PopoBontaKey","AutoPopoBonta","settings.ini",BontaKey)
		UpdateSettings("PopoBontaDelay","AutoPopoBonta","settings.ini",PopoBontaDelay)
		
		UpdateSettings("AutoPopoBrakmarKey","AutoPopoBrakmar","settings.ini",PopoBrakmarKey)
		UpdateSettings("PopoBrakmarKey","AutoPopoBrakmar","settings.ini",BrakmarKey)
		UpdateSettings("PopoBrakmarDelay","AutoPopoBrakmar","settings.ini",PopoBrakmarDelay)
		
		UpdateSettings("AutoBreadKey","AutoBread","settings.ini",UseBreadKey)
		UpdateSettings("BreadDelay","AutoBread","settings.ini",BreadDelay)
	
		UpdateSettings("AutoMessage1Key","AutoMessage1","settings.ini",Message1Key)
		UpdateSettings("CustomText1","AutoMessage1","settings.ini",CustomTText1)
		
		UpdateSettings("AutoMessage2Key","AutoMessage2","settings.ini",Message2Key)
		UpdateSettings("CustomText2","AutoMessage2","settings.ini",CustomTText2)
	

		UpdateSettings("AutoMessage3Key","AutoMessage3","settings.ini",Message3Key)
		UpdateSettings("CustomText3","AutoMessage3","settings.ini",CustomTText3)
		
	

		UpdateSettings("AutoTradeKey","AutoTrade","settings.ini",TradeKey)
		UpdateSettings("TradeDelay","AutoTrade","settings.ini",TradeDelay)

		
		UpdateSettings("AutoChestKey","AutoChest","settings.ini",Chest)
		UpdateSettings("ChestKey","AutoChest","settings.ini",ChestKey)
		UpdateSettings("ChestDelay","AutoChest","settings.ini",ChestDelay)
		UpdateSettings("AnySpellKey","AutoChest","settings.ini",AnySpellKey)
		
		
		UpdateSettings("LeftKey","AutoChangeMap","settings.ini",LeftK)
		UpdateSettings("RightKey","AutoChangeMap","settings.ini",RightK)
		UpdateSettings("TopKey","AutoChangeMap","settings.ini",TopK)
		UpdateSettings("BottomKey","AutoChangeMap","settings.ini",BottomK)

		



	Hotkey IfWinActive, ahk_class AutoHotkeyGUI
	Hotkey, %ReloadKey%, myReloadKey, on
	Hotkey, %ExitKey%, myExitKey,  on
	Hotkey IfWinActive,

	Hotkey IfWinActive, ahk_exe Dofus*
	Hotkey,% NextTabKey, mySwitchTabKey, on
	Hotkey,% PreviousTabKey, myPreviousTabKey, on
	
	Hotkey,% AutoJoinKey, myJoinKey, on
	Hotkey,% AutoClickKey, myClickKey, on
	Hotkey,% AutoReadyKey, myReadyKey, on
	Hotkey,% AutoInviteKey, myInviteKey, on
	Hotkey,% AutoSwitchKey, mySwitchKey, on
	Hotkey,% AutoPairingKey, myIdentifyKey, on
	Hotkey,% AutoMoveKey, myMoveKey, on
	Hotkey,% ReloadKey, myReloadKey, on
	Hotkey,% ExitKey, myExitKey, on
	Hotkey,% AutoSkipKey, mySkipKey, on
	Hotkey,% AutoCtrlClick, myCtrlClickKey, on
	Hotkey,% AutoTradeKey, myTradeKey, on
	Hotkey,% AutoNoLootKey, myLootKey, on
	Hotkey,% AutoPopoRappelKey, myRappelKey, on	
	Hotkey,% AutoPopoBontaKey, myBontaKey, on
	Hotkey,% AutoPopoBrakmarKey, myBrakmarKey, on
	Hotkey,% AutoEmptyBankKey, myEmptyBankKey, on

	Hotkey,% AutoBreadKey, myBreadKey, on
	Hotkey,% AutoMessage1Key, myMessage1Key, on
	Hotkey,% AutoMessage2Key, myMessage2Key, on
	Hotkey,% AutoMessage3Key, myMessage3Key, on
	
	
	Hotkey, %LeftKey%, myLeftKey, on
	Hotkey, %RightKey%, myRightKey, on
	Hotkey, %BottomKey%, myBottomKey, on
	Hotkey, %TopKey%, myTopKey, on


	Hotkey IfWinActive,
	
	 

}
return





SavePartyGUI:

Hotkey IfWinActive, ahk_class AutoHotkeyGUI
if(OpenPartyGUIKey){
	Hotkey, %OpenPartyGUIKey%, myOpenPartyKey, off
}
Hotkey IfWinActive,

		Hotkey IfWinActive, ahk_exe Dofus*
		if(OpenPartyGUIKey){
	Hotkey, %OpenPartyGUIKey%, myOpenPartyKey, off
}
			
		Hotkey IfWinActive,
Gui 2:Submit, NoHide
	
		
GuiControlGet,PartyGUIW
GuiControlGet,PartyGUIH
GuiControlGet,PartyGUIX
GuiControlGet,PartyGUIY

GuiControlGet,PartyGUIBackgroundColor

GuiControlGet,PartyGUICurrentPlayerColor
GuiControlGet,PartyGUIPlayerSkipColor
GuiControlGet,PartyGUIPlayerDisableColor

GuiControlGet,PartyGUINameFont
GuiControlGet,PartyGUINameFontSize
GuiControlGet,PartyGUINameFontColor
GuiControlGet,PartyGUIButtonFontSize

GuiControlGet,PartyGUIOpenSizeW
GuiControlGet,PartyGUIOpenSizeH
GuiControlGet,PartyGUIDisableSizeW
GuiControlGet,PartyGUIDisableSizeH
GuiControlGet,PartyGUISkipSizeW
GuiControlGet,PartyGUISkipSizeH
GuiControlGet,NameStartY
GuiControlGet,NameStartX
GuiControlGet,buttonStartX
GuiControlGet,distanceBetweenButtonOpenDisableX
GuiControlGet,distanceBetweenButtonDisableSkipX
GuiControlGet,distanceBetweenNameAndButtonY
GuiControlGet,distanceBetweenEachCharacterAndButton
GuiControlGet,OpenPartyKey
GuiControlGet,charIndicatorImgX
GuiControlGet,charIndicatorImgY

	UpdateSettings("PartyGUIW","PartyGUI","partyGUI.ini",PartyGUIW)
	UpdateSettings("PartyGUIH","PartyGUI","partyGUI.ini",PartyGUIH)
	UpdateSettings("PartyGUIX","PartyGUI","partyGUI.ini",PartyGUIX)
	UpdateSettings("PartyGUIY","PartyGUI","partyGUI.ini",PartyGUIY)
	
	
	UpdateSettings("PartyGUIBackgroundColor","PartyGUI","partyGUI.ini",PartyGUIBackgroundColor)
	UpdateSettings("PartyGUIPlayerSkipColor","PartyGUI","partyGUI.ini",PartyGUIPlayerSkipColor)
	UpdateSettings("PartyGUIPlayerDisableColor","PartyGUI","partyGUI.ini",PartyGUIPlayerDisableColor)
	UpdateSettings("PartyGUICurrentPlayerColor","PartyGUI","partyGUI.ini",PartyGUICurrentPlayerColor)
	UpdateSettings("PartyGUINameFont","PartyGUI","partyGUI.ini",PartyGUINameFont)
	UpdateSettings("PartyGUINameFontSize","PartyGUI","partyGUI.ini",PartyGUINameFontSize)
	UpdateSettings("PartyGUINameFontColor","PartyGUI","partyGUI.ini",PartyGUINameFontColor)
	UpdateSettings("PartyGUIButtonFontSize","PartyGUI","partyGUI.ini",PartyGUIButtonFontSize)
	
	UpdateSettings("PartyGUIOpenSizeW","PartyGUI","partyGUI.ini",PartyGUIOpenSizeW)
	UpdateSettings("PartyGUIOpenSizeH","PartyGUI","partyGUI.ini",PartyGUIOpenSizeH)
	UpdateSettings("PartyGUIDisableSizeW","PartyGUI","partyGUI.ini",PartyGUIDisableSizeW)
	UpdateSettings("PartyGUIDisableSizeH","PartyGUI","partyGUI.ini",PartyGUIDisableSizeH)
	
	UpdateSettings("PartyGUISkipSizeW","PartyGUI","partyGUI.ini",PartyGUISkipSizeW)
	UpdateSettings("PartyGUISkipSizeH","PartyGUI","partyGUI.ini",PartyGUISkipSizeH)
	UpdateSettings("NameStartY","PartyGUI","partyGUI.ini",NameStartY)
	UpdateSettings("NameStartX","PartyGUI","partyGUI.ini",NameStartX)
	UpdateSettings("buttonStartX","PartyGUI","partyGUI.ini",buttonStartX)
	UpdateSettings("distanceBetweenButtonOpenDisableX","PartyGUI","partyGUI.ini",distanceBetweenButtonOpenDisableX)
	UpdateSettings("distanceBetweenButtonDisableSkipX","PartyGUI","partyGUI.ini",distanceBetweenButtonDisableSkipX)
	UpdateSettings("distanceBetweenNameAndButtonY","PartyGUI","partyGUI.ini",distanceBetweenNameAndButtonY)
	UpdateSettings("distanceBetweenEachCharacterAndButton","PartyGUI","partyGUI.ini",distanceBetweenEachCharacterAndButton)
	UpdateSettings("charIndicatorImgX","PartyGUI","partyGUI.ini",charIndicatorImgX)
	UpdateSettings("charIndicatorImgY","PartyGUI","partyGUI.ini",charIndicatorImgY)
	
	if(OpenPartyKey){
		UpdateSettings("OpenPartyGUIKey","PartyGUI","partyGUI.ini",OpenPartyKey)
		Hotkey IfWinActive, ahk_class AutoHotkeyGUI
if(OpenPartyGUIKey){
	Hotkey, %OpenPartyGUIKey%, myOpenPartyKey, on
}
Hotkey IfWinActive,

		Hotkey IfWinActive, ahk_exe Dofus*
			Hotkey, %OpenPartyGUIKey%, myOpenPartyKey, on
		Hotkey IfWinActive,
	  
			  MsgBox,, HEY BABE, SAVING ... , 0.5
	} else {
	MsgBox % "OpenPartyKey is empty"
}
	
	

	Gui,2:Destroy
	gosub PartyGui
	
return

OpenGUIFOLDER:
run %A_MyDocuments%\Dofus_Helper
return

ResetControlGUI:
MsgBox, 4,WADAFOK, Are you sure you want to reset your settings ? 

IfMsgBox, Yes
{
  FileDelete, %A_MyDocuments%\Dofus_Helper\controlGUI.ini
  
    Gui,6:Destroy
	gosub controlGUI
}
return

OpenPartyFolder:
run %A_MyDocuments%\Dofus_Helper
return

ResetPartyGUI:
MsgBox, 4,WADAFOK, Are you sure you want to reset your settings ? 

IfMsgBox, Yes
{
  FileDelete, %A_MyDocuments%\Dofus_Helper\partyGUI.ini
  
    
	callReload()
}
return


OpenFolderContainingNames:
run %A_MyDocuments%\Dofus_Helper\SCREENSHOT
return

OpenFolderContainingNamesEchange:
run %A_MyDocuments%\Dofus_Helper\SCREENSHOT-ECHANGE
return

ResetKey:
MsgBox, 4,WADAFOK, Are you sure you want to reset your settings ? 


IfMsgBox, Yes
{
  FileDelete, %A_MyDocuments%\Dofus_Helper\settings.ini
  
   callReload()
}
return





;-------------------------------------------------------
;
;
; START DOFUS/CONNECT , ADD ACCOUNT TO FILE AND EDIT FILE
;
;
;-------------------------------------------------------

 

 checkEmptyListView(listview){
	gui, listview, %listview%
	   Loop
   {
      RowNumber := LV_GetNext(RowNumber,"Checked")  ; Resume the search at the row after that found by the previous iteration.
      
      if not RowNumber  ; The above returned zero, so there are no more selected rows.
      return true
	  else return false
}
}


StartDofusAndLogIn:
	boolLogin:=false


boolEmptyList1:= checkEmptyListView("listview1")
boolEmptyList2:= checkEmptyListView("listview2")

 if(boolEmptyList1 && boolEmptyList2){
MsgBox,4096,HEY YOU!, Please select an account or a team.
return
} 

 if(!boolEmptyList1 && !boolEmptyList2){
MsgBox,4096,HEY YOU !, Please select an account or a team.
return
} else

 if(!boolEmptyList2 && boolEmptyList1){
	boolSolo:=false
startTeam()
} else
if(boolEmptyList2 && !boolEmptyList1){
	
	boolSolo:=true
	startAccount()
}


return

startAccount(){
	countDofusToLog := 0
	getDofusWindowsName()
	if(!IsArrayEmpty(dofusWindowsName)){
		for key,val in Nicknames {
		if(containsValueInArray(dofuswindowsname, val.name)){

		} else {
		 Nicknames.Remove(key)
	}
}
} else {
Nicknames := array()	
}
	gui, listview, listview1
   RowNumber := 0  ; This causes the first loop iteration to start the search at the top of the list.
   Loop
   {
      RowNumber := LV_GetNext(RowNumber,"Checked")  ; Resume the search at the row after that found by the previous iteration.
      
      if not RowNumber  ; The above returned zero, so there are no more selected rows.
      break
	  
      StartDofus()
	  Sleep %StartDofusDelay%
      atleastOneOpen := true
countDofusToLog++
   }
   
   gosub, myLogInMenu
}

myLogInMenu:
startX := 120
startY = 60
Gui,5 :Color, 0b1013
Gui,5 :Font, s14 cfbdbba, Candara
Gui,5: font,bold
Gui,5: Add, Text,% " x" startX-60   " y"startY-30 " vLoading",PLEASE WAIT WHILE DOFUS ARE LOADING
Gui,5: Add, Text,% " x" startX+50  " y"startY-30 " vLogging",LOGGING IN ... 
GuiControl,5:Hide,Logging
Gui,5: Add, Text,% " x" startX-60   " y"startY-30 " vSelecting",SELECTING SERVERS AND CHARACTERS ...
GuiControl,5:Hide,Selecting

Gui 5: Add, GroupBox,% " x" startX   " y"startY " w"100 " h"60 " ce0e01d" " vGroupBoxLogIn",
Gui 5: Add, Text, % " x"startX+22 " y"startY+25   " vLoginDofus" " cfbdbba" " h"30,LOG IN  
startX :=startX +120
Gui 5: Add, GroupBox,% " x" startX   " y"startY " w"100 " h"60 " ce0e01d" " vGroupBoxCancel",
Gui 5: Add, Text, % " x"startX+19 " y"startY+25   " vCancelDofus" " cfbdbba" " h"30,CANCEL  

startX := 60
if(AutoSelect){
	countDofusToLog:= countDofusToLog*2
}
Gui 5: Add, Progress,% " x"startX+16 " y"startY+80 " cfbdbba " "Range0-" countDofusToLog " Background0b1013 "  " -Smooth" " vMyProgress" " w300",
Gui 5:-Caption
Gui 5:+AlwaysOnTop

Gui 5:Show,w450 h200, ProgressBar

#IfWinActive ProgressBar
~LButton::
CoordMode,Mouse,Client
GuiControlGet,BoxLogIn,5: Pos,GroupBoxLogIn
GuiControlGet,BoxCancel,5: Pos,GroupBoxCancel

BoxLogInX := Ceil(BoxLogInX*(A_ScreenDPI/96))
BoxLogInY := Ceil(BoxLogInY*(A_ScreenDPI/96))
BoxLogInW:= Ceil(BoxLogInW*(A_ScreenDPI/96))
BoxLogInH:= Ceil(BoxLogInH*(A_ScreenDPI/96))

BoxCancelX := Ceil(BoxCancelX*(A_ScreenDPI/96))
BoxCancelY := Ceil(BoxCancelY*(A_ScreenDPI/96))
BoxCancelW := Ceil(BoxCancelW*(A_ScreenDPI/96))
BoxCancelH := Ceil(BoxCancelH*(A_ScreenDPI/96))

MouseGetPos,x,y
if(!boolLogin){
if((x >= BoxLogInX && x <= BoxLogInX+BoxLogInW)) && (y >= BoxLogInY && y <= BoxLogInY+BoxLogInH){
	boolLogin:=true
		Gui 5:Font,  s14 cred, Candara
	GuiControl,5: Font,Logging
	GuiControl,5:Show,Logging
	GuiControl,5:Hide,Loading
	if(boolSolo){
		logIn()
	} else {

LogInTeam()		
}
	Gui 5:Destroy
}
}


if((x >= BoxCancelX && x <= BoxCancelX+BoxCancelW)) && (y >= BoxCancelY && y <= BoxCancelY+BoxCancelH){
	Gui 5:Font,  s14 cc41a2b, Candara
	GuiControl,5: Font,Loading 

	
loop, % countDofusToLog
{
	
	WinClose, ahk_exe Dofus*
	Sleep 200
	
}

	Gui 5:Destroy
	
}

	GuiControl,5:Hide,Selecting
	GuiControl,5:Hide,Logging
	
OnMessage(0x0201, "WM_LBUTTONDOWN")

#IfWinActive
return


logIn(){
	
      getListOfDofusPID()
		
	 RowNumber := 0  ; This causes the first loop iteration to start the search at the top of the list.
   Loop
   {
      RowNumber := LV_GetNext(RowNumber,"Checked")  ; Resume the search at the row after that found by the previous iteration.
      if not RowNumber  ; The above returned zero, so there are no more selected rows.
      break
         LV_GetText(Text, RowNumber)
		 
		 if(!EnableSniper){
	
			dofusWindowsPID := dofusWindows[A_index].pid

		ControlSend,,{text}%text%,ahk_pid %dofusWindowsPID%
		ControlSend,,{tab},ahk_pid %dofusWindowsPID%
		ControlSend,,% "{text}" account[text],ahk_pid %dofusWindowsPID%
		ControlSend,,{tab},ahk_pid %dofusWindowsPID%
		ControlSend,,{Enter},ahk_pid %dofusWindowsPID%
	
		IniRead, charName, pairing.ini,Accounts,%Text%,% "Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
		
		if(charName==""){
			charName:="Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
	}

	Nicknames.push(new NicknamesPaired(charName,dofusWindowsPID))

		GuiControl,5:, MyProgress, +1

	
		WinSetTitle,ahk_pid %dofusWindowsPID%,,%charName%



	WinMaximize, ahk_pid %dofusWindowsPID%

	Sleep, %AutoLogInDelay%
	
		} else {
	
		dofusWindowsPID := dofusWindows[A_index].pid
		WinActivate, % "ahk_pid" dofusWindowsPID
		WinWaitActive, % "ahk_pid" dofusWindowsPID
		WinMaximize,  % "ahk_pid" dofusWindowsPID
		
		Sleep 100
		ControlClick,% " x"IdX " y"IdY,% "ahk_pid" dofusWindowsPID,, left,2
		ControlSend,,{text}%text%,ahk_pid %dofusWindowsPID%
		Sleep %DelayClickAfterLoadingScreen%
		ControlClick,% " x"PwX " y"PwY,% "ahk_pid" dofusWindowsPID,, left,2
		ControlSend,,% "{text}" account[text],ahk_pid %dofusWindowsPID%
		ControlSend,,{tab},ahk_pid %dofusWindowsPID%
		ControlSend,,{Enter},ahk_pid %dofusWindowsPID%
		
	
		GuiControl,5:, MyProgress, +1

		IniRead, charName, pairing.ini,Accounts,%Text%,% "Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
		if(charName==""){
			charName:="Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
	}
	
		Nicknames.push(new NicknamesPaired(charName,dofusWindowsPID))
	
	
		WinSetTitle,ahk_pid %dofusWindowsPID%,,%charName%


		}
		 Sleep, %AutoLogInDelay%
}


; Auto Select log in
if(AutoSelect){
Gui 5:Font,  s14 cred, Candara
GuiControl,5: Font,Selecting
	GuiControl,5:Show,Selecting
	GuiControl,5:Hide,Logging
	
	Sleep %AutoLogInDelayBetweenLogAndServer%
 Loop
   {
      RowNumber := LV_GetNext(RowNumber,"Checked")  ; Resume the search at the row after that found by the previous iteration.
      if not RowNumber  ; The above returned zero, so there are no more selected rows.
      break
         LV_GetText(Text, RowNumber)
		 
		dofusWindowsPID := dofusWindows[A_index].pid
		
		IniRead, charName, pairing.ini,Accounts,%Text%,% "Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
	
		IniRead,ServerSlot, pairing.ini,Accounts,% charName "Server"
		IniRead,ServerSlotX,coordinates.ini,Slot,% "Slot" ServerSlot "X"
		IniRead,ServerSlotY,coordinates.ini,Slot,% "Slot" ServerSlot "Y"
		ControlClick,% " x"ServerSlotX " y"ServerSlotY,% "ahk_pid" dofusWindowsPID,, left,4
		
		
		IniRead,CharSlot, pairing.ini,Accounts,% charName "Char"
		IniRead,CharSlotX,coordinates.ini,Slot,% "Slot" CharSlot "X"
		IniRead,CharSlotY,coordinates.ini,Slot,% "Slot" CharSlot "Y"
		Sleep %AutoLogInDelayBetweenServerAndCharacter%
		ControlClick,% " x"CharSlotX " y"CharSlotY,% "ahk_pid" dofusWindowsPID,, left,4
	
		;MsgBox % "Slot Number " ServerSlot "X : " ServerSlotX " and Y: " ServerSlotY " and CharSlot" CharSlot 
		GuiControl,5:, MyProgress, +1

}
	
}




   Gui 5:Destroy
	Gui 2: Destroy
	gosub, PartyGUI

boolLogin:=false
	} 


startTeam(){
	countDofusToLog := 0
		getDofusWindowsName()
	if(!IsArrayEmpty(dofusWindowsName)){
		for key,val in Nicknames {
		if(containsValueInArray(dofuswindowsname,val.name)){
		} else {
		 Nicknames.Remove(key)
	}
}
} else {
Nicknames := array()	
}

	gui, listview, listview2
LastTeam:=""	
boolOneTeam := true 
count:=0
	AccountInTeam := array()
   Loop
   {
      RowNumber := LV_GetNext(RowNumber,"Checked")  ; Resume the search at the row after that found by the previous iteration.
      if not RowNumber  ; The above returned zero, so there are no more selected rows.
		break
	
	count++
	if(count>1){
			MsgBox,4096,HEEY YOU !, SELECT ONLY 1 TEAM !
boolOneTeam := false
break
	}
	
	}

if(boolOneTeam){
	Loop
   {
      RowNumber := LV_GetNext(RowNumber,"Checked")  ; Resume the search at the row after that found by the previous iteration.
      
	  
      if not RowNumber  ; The above returned zero, so there are no more selected rows.
		break
	LV_GetText(Text, RowNumber)
	getTeam:=Text

}

	 Loop, Read, % A_WorkingDir . "\teams.ini"
      {
			If InStr(A_LoopReadLine, getTeam){
				LastTeam := A_LoopReadLine
				lineFound := A_Index
				break
			}
}

	 Loop, Read, % A_WorkingDir . "\teams.ini"
      {
		If(A_Index > lineFound ){
		If(InStr(A_LoopReadLine, "[")){
				Break
			
		}
		}
			
		If(A_Index > lineFound ){
		AccountInTeam.push(A_LoopReadLine)

		}

}

for key, val in AccountInTeam {

		countDofusToLog++
}

    if WinExist("ahk_exe Ankama Launcher.exe"){
		WinActivate, Ankama 
		Sleep 500
	Send {Ctrl down}{%countDofusToLog%}{Ctrl up}
   gosub, myLogInMenu
   	
	} else {
		MsgBox Ankama Launcher doit être allumé 
}
  

}



}
 


logInTeam(){
	
  getListOfDofusPID()


	  
for key, val in AccountInTeam {
	
		 if(!EnableSniper){
				dofusWindowsPID := dofusWindows[A_index].pid
	  
	  
	  	ControlSend,,{text}%val%,ahk_pid %dofusWindowsPID%
		ControlSend,,{tab},ahk_pid %dofusWindowsPID%
		ControlSend,,% "{text}" account[val],ahk_pid %dofusWindowsPID%
		ControlSend,,{tab},ahk_pid %dofusWindowsPID%
		ControlSend,,{Enter},ahk_pid %dofusWindowsPID%
	
		IniRead, charName, pairing.ini,Accounts,%val%,% "Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
		if(charName==""){
			charName:="Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
	}
	


		WinSetTitle,ahk_pid %dofusWindowsPID%,,%charName%
	Nicknames.push(new NicknamesPaired(charName,dofusWindowsPID))
	WinSetTitle,ahk_pid %dofusWindowsPID%,,%charName%
	WinMaximize, ahk_pid %dofusWindowsPID%

		GuiControl,5:, MyProgress, +1

	
	

	
		} else {
	
		dofusWindowsPID := dofusWindows[A_index].pid
		WinActivate, % "ahk_pid" dofusWindowsPID
		WinWaitActive, % "ahk_pid" dofusWindowsPID
		WinMaximize,  % "ahk_pid" dofusWindowsPID
		
	
		ControlClick,% " x"IdX " y"IdY,% "ahk_pid" dofusWindowsPID,, left,2
			if(val=="40397"){
			ControlSend,,{text}"0",ahk_pid %dofusWindowsPID%
		}
		ControlSend,,{text}%val%,ahk_pid %dofusWindowsPID%
			Sleep %DelayClickAfterLoadingScreen%
		ControlClick,% " x"PwX " y"PwY,% "ahk_pid" dofusWindowsPID,, left,2
		ControlSend,,% "{text}" account[val],ahk_pid %dofusWindowsPID%
		ControlSend,,{tab},ahk_pid %dofusWindowsPID%
		ControlSend,,{Enter},ahk_pid %dofusWindowsPID%
		
		
		GuiControl,5:, MyProgress, +1

		IniRead, charName, pairing.ini,Accounts,%val%,% "Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
		if(charName==""){
			charName:="Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
	}
	
		Nicknames.push(new NicknamesPaired(charName,dofusWindowsPID))
	
	
		WinSetTitle,ahk_pid %dofusWindowsPID%,,%charName%


	
	}
	
	Sleep, %AutoLogInDelay%

}

; Auto Select log in
if(AutoSelect){
	Gui 5:Font,  s14 cred, Candara
GuiControl,5: Font,Selecting
	GuiControl,5:Show,Selecting
	GuiControl,5:Hide,Logging
	
	Sleep %AutoLogInDelayBetweenLogAndServer%

for key,val in AccountInTeam {
	
		dofusWindowsPID := dofusWindows[A_index].pid
		
		IniRead, charName, pairing.ini,Accounts,%val%,% "Auto Pairing n'a pas été configuré. Veuillez saisir le nom de vos personnages dans ""Accounts"" -> Auto Pairing - Link Char / Auto Pairing hasn't been set up. Please input your characters' name in ""Accounts"" -> Auto Pairing - Link Char.  "
	
	

		IniRead,ServerSlot, pairing.ini,Accounts,% charName "Server"
		IniRead,ServerSlotX,coordinates.ini,Slot,% "Slot" ServerSlot "X"
		IniRead,ServerSlotY,coordinates.ini,Slot,% "Slot" ServerSlot "Y"

	
		ControlClick,% " x"ServerSlotX " y"ServerSlotY,% "ahk_pid" dofusWindowsPID,, left,4
		Sleep %AutoLogInDelayBetweenServerAndCharacter%
		IniRead,CharSlot, pairing.ini,Accounts,% charName "Char"
		
		IniRead,CharSlotX,coordinates.ini,Slot,% "Slot" CharSlot "X"
	
		IniRead,CharSlotY,coordinates.ini,Slot,% "Slot" CharSlot "Y"


		ControlClick,% " x"CharSlotX " y"CharSlotY,% "ahk_pid" dofusWindowsPID,, left,4
	

		GuiControl,5:, MyProgress, +1

}
	
}


  Gui 5:Destroy
Gui 2: Destroy
gosub, PartyGUI

boolLogin:=false
}
 
TeamMaker:
gui, listview, listview1
	GuiControlGet, TeamName
	count=0
	
	if(TeamName ="TeamName"){
	MsgBox,48,I'm so sexy, Please set a name for your team
		return
	}
	
	  Loop
   {
      RowNumber := LV_GetNext(RowNumber,"Checked")  ; Resume the search at the row after that found by the previous iteration.
      if not RowNumber  ; The above returned zero, so there are no more selected rows.
	
      break
	  count++
      LV_GetText(Text, RowNumber)
	  IniWrite,%Text%,teams.ini,%TeamName%
  }
  
  if(count=0){
	MsgBox,48,I'm sexy, Select an account to add in the team
	} else {
		callReload()	
}


return	

	
	




RegisterAccountToFile:
Gui,Submit, NoHide
   GuiControlGet, Id
   GuiControlGet, Mdp
   AlreadyExist := false
    
   if(Id != "" && Mdp != ""){
      Loop, Read, % A_WorkingDir . "\accounts.txt"
      {
         Loop, Parse, A_LoopReadLine, `:
          
         {
            accName := A_LoopField
	
            account[accName] := "empty"
             
            if(accName=Id){
               MsgBox, 48, GOLD FISH ?, GRANDMA YOU ALREADY ADDED THIS ACCOUNT 
               AlreadyExist := true
            }}}
       
      if(!AlreadyExist){
         FileAppend, %id%:%Mdp%`n,% A_WorkingDir . "\accounts.txt"
         MsgBox, 48, NICE BOOTY,SUCCESSFULLY ADDED,0.5
         GuiControl,,Id,
         GuiControl,,Mdp, 
       callReload()
      }
	  
	  }
return




EditFile:
   Run, % A_WorkingDir . "\accounts.txt"
return

EditTeamFile:
Run, % A_WorkingDir . "\teams.ini"
return

OpenSettings:
	Run, % A_WorkingDir . "\settings.ini"
return

;-------------------------------------------------------
;
;
; SWITCH BETWEEN TAB !!!
;
;
;-------------------------------------------------------

containsValueInEnabledCharArray(x){
for key, val in enabledChar{
	if(val == x){
	return true	
	}
}
return false
}


mySwitchTabKey:

WinGet, var, PID, A

for key, val in nicknames {
if(!WinExist("ahk_pid" . nicknames[A_index].pid)){
Nicknames.removeAt(A_index)
	ifWinExist,PARTY
Gui 2: Destroy
	goto, PartyGUI
	
} 	
}


if(nicknames.length()== HowManyDofusOpen()){

	countSwitchTab++
if(countSwitchTab> nicknames.length()){
	countSwitchTab:=1
}

while(disabledchar[nicknames[countSwitchTab].name]){
	countSwitchTab++
if(countSwitchTab >=nicknames.length()){
	countSwitchTab:= 1
	break
}
}

WinActivate, % "ahk_pid" nicknames[countSwitchTab].pid
coloractivechar()

} else {

if(dofuswindows.length() == 0){
	
getListOfDofusPid()	

}
	countSwitchTab++
if(countSwitchTab> dofusWindows.length()){
	countSwitchTab:=1
}

WinActivate, % "ahk_pid" dofusWindows[countSwitchTab].pid


}

return


myPreviousTabKey:
WinGet, var, PID, A

for key, val in nicknames {
if(!WinExist("ahk_pid" . nicknames[A_index].pid)){
Nicknames.removeAt(A_index)
	ifWinExist,PARTY
Gui 2: Destroy
	goto, PartyGUI
	
} 	

}


if(nicknames.length()== HowManyDofusOpen()){
countSwitchTab--

if(countSwitchTab <= 0){
	countSwitchTab:= nicknames.length()
}

while(disabledchar[nicknames[countSwitchTab].name]){
	countSwitchTab--
if(countSwitchTab <= 0){
	countSwitchTab:= nicknames.length()
	break
}

}



WinActivate, % "ahk_pid" nicknames[countSwitchTab].pid
if(!WinActive("ahk_pid" . nicknames[countSwitchTab].pid)){
Nicknames.removeAt(countSwitchTab)
	ifWinExist,PARTY
Gui 2: Destroy
	goto, PartyGUI
	
} 

coloractivechar()
} else {
countSwitchTab--

if(dofuswindows.length() == 0){
getListOfDofusPid()	
}


if(countSwitchTab <= 0){
	countSwitchTab:= dofuswindows.length()
}

WinActivate, % "ahk_pid" dofuswindows[countSwitchTab].pid

}

return


;-------------------------------------------------------
;
;
; JOIN, Click, IDENTIFY, AUTOSWITCH BATTLE, READY SKIP
;
;
;-------------------------------------------------------
myCtrlClickKey:
loop, %ClickCount%{
Send, {Ctrl Down}{Click}{Ctrl up}
Sleep 100
}


return



myIdentifyKey:
Nicknames := array()
disabledChar := array()
	gosub myswitchtabkey
	
loop, % HowManyDofusOpen(){
	IdentifyAcc()

}

Tooltip,
Gui 2: Destroy
goto, PartyGUI
return

IdentifyAcc(){
	WinGetTitle, title, A
	FoundPos := InStr(title, " ")
	title := SubStr(title, 1,FoundPos-1)
	WinGet, var, PID, A
	pid := var
	Nicknames.push(new NicknamesPaired(title,var))
	WinWaitActive, ahk_pid %var%
	gosub myswitchtabkey
	return
}

;-------------------------------------------------------
;
;  JOIN
;
;------------------------------------------------------

myJoinKey:

MouseGetPos,startXpos, startYpos,,0
count := HowManyDofusOpen() - disabledCharCount

loop, % count{
	gosub mySwitchTabKey
MouseMove,startXpos,startYpos+1,0
Send {LShift Down}{LButton}
Send {LShift Up}
Sleep %JoinDelay%

}



return
 
 
;-------------------------------------------------------
;
;  Click
;
;------------------------------------------------------


myClickKey:

MouseGetPos,startXpos, startYpos,,0
count := HowManyDofusOpen() - disabledCharCount

Random, delay, ClickDelay, ClickDelay+ClickRandomDelay
loop, % count{
	gosub mySwitchTabKey
MouseMove,startXpos,startYpos+1,0
Send {LButton}
Sleep %delay%

}


return

;-------------------------------------------------------
;
;
; GET COORDINATES
;
;
;-------------------------------------------------------

CoordinatesLogInID:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the Ready button
KeyWait, LButton, D
ToolTip, 
SetPos("IdX","IdY","AutoLogIn")
return


CoordinatesLogInPW:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the Ready button
KeyWait, LButton, D
ToolTip, 
SetPos("PwX","PwY","AutoLogIn")
return

CoordinatesReady:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the Ready button
KeyWait, LButton, D
ToolTip, 
SetPos("ReadyButtonX","ReadyButtonY","AutoReady")
return

CoordinatesChat:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the chat
KeyWait, LButton, D
ToolTip, 
SetPos("PairingChatPositionX","PairingChatPositionY","Pairing")
return


CoordinatesNamePos1:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 
SetPos("NameTurnPosX1","NameTurnPosY1","AutoSwitch")
return

CoordinatesNamePos2:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the LOWER RIGHT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("NameTurnPosX2","NameTurnPosY2","AutoSwitch")
return

CoordinatesTurnIndicator1:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("TurnIndicatorPosX1","TurnIndicatorPosY1","AutoBuff")
return


CoordinatesTurnIndicator2:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("TurnIndicatorPosX2","TurnIndicatorPosY2","AutoBuff")
return


CoordinatesWholeMap1:

Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("WholeMapPosX1","WholeMapPosY1","AutoBuff")


return


CoordinatesWholeMap2:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 
SetPos("WholeMapPosX2","WholeMapPosY2","AutoBuff")
return


CoordinatesTrade:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search. Press "S" to set the position
KeyWait, S, D
ToolTip, 
SetPosAndGetColor("TradeAcceptButtonX1","TradeAcceptButtonY1","AutoTrade")
return

CoordinatesTradeNamePos1:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("TradeNamePosX1","TradeNamePosY1","AutoTrade")
return

CoordinatesTradeNamePos2:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 
SetPos("TradeNamePosX2","TradeNamePosY2","AutoTrade")
return

CoordinatesEndFightIndicator1:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("EndFightIndicatorPosX1","EndFightIndicatorPosY1","EndFightIndicatorPosition")
return

CoordinatesSlot1:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("Slot1X","Slot1Y","Slot")
return

CoordinatesSlot2:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("Slot2X","Slot2Y","Slot")
return

CoordinatesSlot3:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("Slot3X","Slot3Y","Slot")
return

CoordinatesSlot4:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("Slot4X","Slot4Y","Slot")
return

CoordinatesSlot5:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("Slot5X","Slot5Y","Slot")
return

CoordinatesAutoBread:
Gui, Submit, NoHide
ToolTip, The X and Y coordinates of the UPPER LEFT corner of the rectangle to search
KeyWait, LButton, D
ToolTip, 

SetPos("BreadX","BreadY","AutoBread")
return

;-------------------------------------------------------
;
;
; AUTO SWITCH , INVITE , READY  , ESCAPE
;
;
;-------------------------------------------------------


mySwitchKeyA:

    for key, val in Nicknames {
		name := val.name
ImageSearch, FoundX, FoundY, NameTurnPosX1,NameTurnPosY1, NameTurnPosX2, NameTurnPosY2,*3 %A_MyDocuments%\Dofus_Helper\SCREENSHOT\%name%.png
 if (ErrorLevel = 0) 
   {
	if(val.name!=LastImageFound){
		CloseOnce:= false
		WinActivate,% "ahk_pid" val.pid
		
		if(Synccount==1 ){
		SyncFirstChar:= name
		}

	
	if(SyncCount != A_Index && SyncCount <= Nicknames.length()){
		Temp := Nicknames[A_Index]
		Nicknames.removeAt(A_Index)
		Nicknames.InsertAt(SyncCount,temp)
	}
	
	SyncCount++
	
	if(mod(SyncCount, Nicknames.length()+1)==0){
		SyncCount:=1
	}
	

	
ColorActiveChar()


if(beepArray[val.name]=="1"){
	SoundPlay,*-1	
}

if(nightmode){
spellColor :="0xC47E3A"

} else {
spellColor :="0xAE7133"
}


sleep 100

;0x0066FF

if(boolChest){
if(ChestArray[val.name].cast=1 && ChestArray[val.name].casted=0){
	Sleep %Chestdelay%
	Send %AnySpellKey%
	Sleep 300
PixelSearch, OutputVarX, OutputVarY, WholeMapPosX1, WholeMapPosY1, WholeMapPosX2,WholeMapPosY2,%spellColor%,3,fast
if(ErrorLevel=0){
	Sleep , 100
	Send %ChestKey%
	Sleep , 100
	MouseClick,Left,OutputVarX,OutputVarY
	
	ChestArray[val.name].casted:=1
	
}
}
}



if(boolCupidite){
	if(!boolchest){
		Sleep %CupiditeDelay%
	if(cupiditeArray[val.name].cast=1 && cupiditeArray[val.name].casted=0){
	PixelSearch, OutputVarX, OutputVarY, TurnIndicatorPosX1, TurnIndicatorPosY1, TurnIndicatorPosX2,TurnIndicatorPosY2, 0x0066FF,3,fast
if(ErrorLevel=0){
Send {%CupiditeKey%}
	Sleep , 100
	MouseClick,Left,OutputVarX+15,OutputVarY
	
	
		cupiditeArray[val.name].casted:=1
}
	}
	}
		
}


if(boolChance){
	if(!boolchest){
	if(ChanceArray[val.name].cast=1 && ChanceArray[val.name].casted=0){
		if(boolCupidite){
			Sleep %ChanceDelay%
	}
			
	PixelSearch, OutputVarX, OutputVarY, TurnIndicatorPosX1, TurnIndicatorPosY1, TurnIndicatorPosX2,TurnIndicatorPosY2, 0x0066FF,3,fast
if(ErrorLevel=0){
Send {%ChanceKey%}
	Sleep , 100
	MouseClick,Left,OutputVarX+15,OutputVarY
	ChanceArray[val.name].casted:=1
}
	}
}
}


if(boolCSP1){
		if(CSP1Array[val.name].cast=1 && CSP1Array[val.name].casted=0){
			Sleep %CSP1Delay%
	PixelSearch, OutputVarX, OutputVarY, TurnIndicatorPosX1, TurnIndicatorPosY1, TurnIndicatorPosX2,TurnIndicatorPosY2, 0x0066FF,3,fast
if(ErrorLevel=0){
Send {%CSP1Key%}
	Sleep , 100
	MouseClick,Left,OutputVarX+15,OutputVarY
		CSP1Array[val.name].casted:=1
}
	}
}


if(boolCSP2){
		if(CSP2Array[val.name].cast=1 && CSP2Array[val.name].casted=0){
			Sleep %CSP2Delay%
	PixelSearch, OutputVarX, OutputVarY, TurnIndicatorPosX1, TurnIndicatorPosY1, TurnIndicatorPosX2,TurnIndicatorPosY2, 0x0066FF,3,fast
if(ErrorLevel=0){
Send {%CSP2Key%}
	Sleep , 100
	MouseClick,Left,OutputVarX+15,OutputVarY
	CSP2Array[val.name].casted:=1
}
	}
}

if(boolCSP3){
		if(CSP3Array[val.name].cast=1 && CSP3Array[val.name].casted=0){
			Sleep %CSP3Delay%
	PixelSearch, OutputVarX, OutputVarY, TurnIndicatorPosX1, TurnIndicatorPosY1, TurnIndicatorPosX2,TurnIndicatorPosY2, 0x0066FF,3,fast
if(ErrorLevel=0){
Send {%CSP3Key%}
	Sleep , 100
	MouseClick,Left,OutputVarX+15,OutputVarY
		CSP3Array[val.name].casted:=1 
}
	}
}

if(boolCSP4){
		if(CSP4Array[val.name].cast=1 && CSP4Array[val.name].casted=0){
			Sleep %CSP4Delay%
	PixelSearch, OutputVarX, OutputVarY, TurnIndicatorPosX1, TurnIndicatorPosY1, TurnIndicatorPosX2,TurnIndicatorPosY2, 0x0066FF,3,fast
if(ErrorLevel=0){
Send {%CSP4Key%}
	Sleep , 100
	MouseClick,Left,OutputVarX+15,OutputVarY
		CSP4Array[val.name].casted:=1 
}
	}
}
if(boolSkip){
	if(skippingArray[val.name]=1){
	Sleep %SkipDelay%
	Send {%SkipKey%}
	}	
}
LastImageFound := val.name
   }
}
}

;---------
; End Fight Turn Indicator + Loot
;---------

	PixelSearch, OutputVarX, OutputVarY, EndFightIndicatorPosX1, EndFightIndicatorPosY1-400, EndFightIndicatorPosX1,EndFightIndicatorPosY1+400, 0x0061FF,3,fast
if(ErrorLevel=0){
	SyncCount:=1
	LastImageFound:=""
	boolFound:=true
	if(boolFound){
		if(!CloseOnce){
		if(boolLoot){
		Sleep %NoLootDelay%
	for key,val in Nicknames {
		if(lootArray[val.name]=1){
			ControlClick,% " x"IdX " y"IdY,% "ahk_pid" val.pid,, left,1
			ControlSend,,{Escape},% "ahk_pid" val.pid
		}
		
}

CloseOnce:=true
}
}
}

for key, valoo in nicknames {
CupiditeArray[valoo.name].casted := 0
ChanceArray[valoo.name].casted := 0
ChestArray[valoo.name].casted := 0
CSP1Array[valoo.name].casted := 0
CSP2Array[valoo.name].casted := 0
CSP2Array[valoo.name].casted := 0
CSP4Array[valoo.name].casted := 0
}


}  else {
	
boolFound:= false
}




if(boolEchange){
	if(!boolInTrade){
    for key, val in Nicknames {
		nameis := val.name
ImageSearch, FoundX, FoundY, TradeNamePosX1,TradeNamePosY1, TradeNamePosX2, TradeNamePosY2,*3 %A_MyDocuments%\Dofus_Helper\SCREENSHOT-ECHANGE\%nameis%.png
if (ErrorLevel = 0) 
   {
	
	boolInTrade := true
	if(val.name!=LastImageFoundTrade){
		LastImageFound := val.name
		
	
		ControlClick,% " x"IdX " y"IdY,% "ahk_pid" val.pid,, left,1
		ControlSend,,{Enter},% "ahk_pid" val.pid
		
	charPID := val.pid
   }
}
}
}


PixelGetColor,color,TradeAcceptButtonX1,TradeAcceptButtonY1
	if(color==AcceptButtonColor){
			ControlClick,% "x"TradeAcceptButtonX1 " y"TradeAcceptButtonY1,ahk_pid %charPID%,,left,2
	} else {
		boolInTrade:= false	
}

}

return


callSwitchTabKeyLabel(){
	if(dofusWindows.length() == 0){
	getListOfDofusPID()
}
for key, val in dofusWindows {
if(containsValueInEnabledCharArray(val)){
dofusWindows[val.name] := 0
}
}

dofusWindowsLength := dofusWindows.length()+1
while(--dofusWindowsLength){
if(dofusWindows[dofusWindowsLength]!=0){
dofusWindowsPID := dofusWindows.Pop()	
previousTabArray.Push(dofusWindowsPID)
WinActivate, ahk_pid %dofusWindowsPID%
ColorActiveChar()
	return
} else {
	dofusWindows.Pop()
}
}
return

WinActivate, ahk_pid %dofusWindowsPID%
ColorActiveChar()
}



;-------------------------------------------------------
;
; INVITE
;
;-------------------------------------------------------

myInviteKey:


if(boolSwitch){
	
	boolSwitchWasOn := true
	gosub mySwitchKey
}



WinGet, currentWindowPID, PID, A
	for key, val in Nicknames {
		Sleep 100
		Send, {Enter}
		Sleep 100
		Send, % "/invite " val.name
		Sleep 100
		Send, {Enter}
		Sleep 100
		WinActivate,% "ahk_pid " val.pid
		Sleep 100
		Send, {Enter}
		Sleep, %InviteDelay%
		ColorActiveChar()
}
	WinActivate, % "ahk_pid " currentWindowPID  
	ColorActiveChar()

if(boolSwitchWasOn){
	gosub mySwitchKey
}
return


;-------------------------------------------------------
;
; READY
;
;-------------------------------------------------------



myReadyKey:
count := HowManyDofusOpen() - disabledCharCount
loop, % count{
	gosub mySwitchTabKey
MouseMove,ReadyButtonX,ReadyButtonY+1,0
MouseClick, left, ReadyButtonX,ReadyButtonY,,0
Sleep, %ReadyDelay%
}
return

;-------------------------------------------------------
;
; ESCAPE
;
;-------------------------------------------------------
myMoveKey:
MouseGetPos,startXpos, startYpos,,0
Random, delay, MoveDelay, MoveDelay+MoveRandomDelay

for key,val in nicknames {
		if(!disabledChar[val.name]){
			ControlClick,% "x"startXpos+10 " y"startYpos+10,% "ahk_pid" val.pid,, left,2,NA

Sleep %delay%
		}

}

return
      


myEmptyBankKey:
boolEmptyBank:=!boolEmptyBank

if(boolEmptyBank){
	ToolTip, Empty bank ON
	SetTimer,emptyBank,%EmptyBankDelay%
} else {
	SetTimer,emptyBank,off
ToolTip,
}
return


emptyBank:
MouseGetPos,startXpos, startYpos,,0
Send {Ctrl down}
	for key,val in nicknames {

ControlClick,% "x"startXpos " y"startYpos,% "ahk_pid" val.pid,, left,2

}
Send {Ctrl up}


return

;-------------------------------------------------------
;
;
; FUNCTIONS
;
;
;-------------------------------------------------------

callReload(){
	Reload()
}

SetDofusPath(){
	FileSelectFile, SelectedFile, 3,%A_AppData%\.. , Open a file, 
	
	path := "retroclient\Dofus.exe"
IfInString, SelectedFile, %path%
{
	IniWrite, %SelectedFile%,settings.ini, AutoLogIn, DofusPath
	IniRead,DofusPath,settings.ini, AutoLogIn, DofusPath
}

else {
	
    MsgBox, 48, WADAFOK ,YOU HAVE TO SELECT DOFUS.EXE IN \Ankama\zaap\retro\resources\app.asar.unpacked\retroclient\ `n PRESS START AGAIN!!

}
}

RegisterAccountToFile(acc){
   count:=0
   accName := ""
   Loop, Parse, acc, `:
    
   {
      if(count==0){
         accName := A_LoopField
         account[accName] := "empty"
         count++
      }else  {
         accPw := A_LoopField
         account[accName] := A_LoopField
         count++
      }}
   return
}

StartDofus(){

      Run % DofusPath
      Sleep, 200
}
   
HowManyDofusOpen(){
count := 0

WinGet windows, List
Loop %windows%
{
	id := windows%A_Index%
	WinGet, activeprocess, ProcessName, ahk_id %id%
	
	If (InStr(activeprocess, "Dofus Retro.exe") || InStr(activeprocess, "Dofus.exe"))
	{
				count++
	
	}
}
  return count
}
   
   
SetPos(x,y,sect){
    MouseGetPos, xpos, ypos   
	IniWrite, %xpos%, coordinates.ini, %sect%, %x%
	IniWrite, %ypos%, coordinates.ini, %sect%, %y%
	IniRead, %x%, coordinates.ini, %sect%,%x%
	IniRead, %y%, coordinates.ini, %sect%,%y% 
	MsgBox, 4096,%sect%, % "X="xpos "Y="ypos
	
	return
}

SetPosAndGetColor(x,y,sect){
    MouseGetPos, xpos, ypos
	PixelGetColor,buttonColor,xpos,ypos
	IniWrite, %xpos%, coordinates.ini, %sect%, %x%
	IniWrite, %ypos%, coordinates.ini, %sect%, %y%
	IniWrite, %buttonColor%, coordinates.ini, %sect%, AcceptButtonColor
	
	IniRead, %x%, coordinates.ini, %sect%,%x%
	IniRead, %y%, coordinates.ini, %sect%,%y% 
	IniRead, AcceptButtonColor, coordinates.ini, %sect%, AcceptButtonColor
	MsgBox, 4096, Coordinates, % "X="xpos " Y="ypos  " Color="buttonColor
	return
}

getListOfDofusPID(){
	

dofusWindows := array()
WinGet windows, List
Loop %windows%
{
	id := windows%A_Index%
	WinGet, activeprocess, ProcessName, ahk_id %id%
	
	If (InStr(activeprocess, "Dofus Retro.exe") || InStr(activeprocess, "Dofus.exe"))
	{
	WinGet, var, PID, ahk_id %id%
	
	  dofusWindows.Push(new NicknamesPaired("",var))
	 
	}
}
  return
}



IsArrayEmpty(Array){
	IsEmpty := True
for each, value in Array {
	if (value != "") {
		isEmpty := false
		break
	}
}
return IsEmpty
}


replaceHotkeysByName(x){
		ReplaceSTR := ""
		IfInString, x, ^
		{
			ReplaceSTR := StrReplace(AutoPairingKey,"^","CTRL+")
			
		} else IfInString, x, !
		{
			ReplaceSTR := StrReplace(AutoPairingKey,"!","ALT+")
			
		} else IfInString, x, +
		{
			ReplaceSTR := StrReplace(AutoPairingKey,"+","SHIFT+")
			
		} 
		return ReplaceSTR
}


;-------------------------------------------------------
;
; HOTKEYS
;
;-------------------------------------------------------

myOpenControlGUIKey:
ifWinExist,ControlGUI
Gui 6: Destroy
else 
{
	goto, ControlGUI
}
return

myOpenPartyKey:
ifWinExist,PARTY
Gui 2: Destroy
else 
{
	goto, PartyGUI
}
return


myReloadKey:
callReload()
return

myExitKey:
ExitApp
return


ChickenFactory:
Gui 4:Submit, NoHide
Gui 4: Destroy
Gui 4:Color, 0b1013
Gui 4:Font, s14 cfbdbba, Candara


Hotkey IfWinActive, ahk_exe Dofus*

startX := 180
startY := 30

Gui 4: Add, Text, % " x"startX " y"startY  , Beep
startX := startX+100
Gui 4: Add, Text, % " x"startX " y"startY  , Loot

startX := 40
startY := 50
	for key, val in Nicknames {
		myCharName := val.pid
IniRead,SwitchCharKey%myCharName%,charManager.ini,Characters,% val.name,
IniRead,BeepChar%A_Index%,charManager.ini,Beep,% val.name,0
IniRead,LootChar%A_Index%,charManager.ini,Loot,% val.name,0
IniRead,CupiditeChar%A_Index%,charManager.ini,Cupidite,% val.name,0
IniRead,ChanceChar%A_Index%,charManager.ini,Chance,% val.name,0
IniRead,CoffreChar%A_Index%,charManager.ini,Chest,% val.name,0
IniRead,CSP1Char%A_Index%,charManager.ini,CSP1,% val.name,0
IniRead,CSP2Char%A_Index%,charManager.ini,CSP2,% val.name,0
IniRead,CSP3Char%A_Index%,charManager.ini,CSP3,% val.name,0
IniRead,CSP4Char%A_Index%,charManager.ini,CSP4,% val.name,0
key := SwitchCharKey%myCharName%
beepArray[val.name]:= BeepChar%A_Index%
/*

CupiditeArray[val.name]:= CupiditeChar%A_Index%
ChanceArray[val.name]:= ChanceChar%A_Index%
ChestArray[val.name]:= CoffreChar%A_Index%
CSP1Array[val.name]:= CSP1Char%A_Index%
CSP2Array[val.name]:= CSP2Char%A_Index%
CSP3Array[val.name]:= CSP3Char%A_Index%
CSP4Array[val.name]:= CSP4Char%A_Index%
*/
LootArray[val.name]:= LootChar%A_Index%
; CupiditeArray[val.name]:= new Buff(CupiditeChar%A_Index%,0)
; ChanceArray[val.name]:=new Buff(ChanceChar%A_Index%,0)
; ChestArray[val.name]:= new Buff(CoffreChar%A_Index%,0)
; CSP1Array[val.name]:=new Buff(CSP1Char%A_Index%,0)
; CSP2Array[val.name]:=new Buff(CSP2Char%A_Index%,0)
; CSP3Array[val.name]:=new Buff(CSP3Char%A_Index%,0)
; CSP4Array[val.name]:=new Buff(CSP4Char%A_Index%,0)



Gui 4: Add, Text, % " x"startX+5 " y"startY  " vCharManager"A_Index, % val.name "                       "
Gui 4: Add, Hotkey,% " x" startX  " y"startY+25 " w"90 " h"25  " vSwitchCharKey"myCharName,% SwitchCharKey%myCharName%

	Gui 4: Add, Checkbox, % " x" startX+165   " y"startY+25 " w"90 " h"25 " vBeepChar"A_Index,
	Gui 4: Add, Checkbox,% " x" startX+265  " y"startY+25 " w"90 " h"25  " vLootChar"A_Index ,
	; Gui 4: Add, Checkbox,% " x" startX+365   " y"startY+25 " w"90 " h"25  " vCupiditeChar"A_Index ,
	; Gui 4: Add, Checkbox,% " x" startX+465   " y"startY+25 " w"90 " h"25  " vChanceChar"A_Index ,
	; Gui 4: Add, Checkbox,% " x" startX+565   " y"startY+25 " w"90 " h"25  " vCoffreChar"A_Index ,
	; Gui 4: Add, Checkbox,% " x" startX+665   " y"startY+25 " w"90 " h"25  " vCSP1Char"A_Index ,
	; Gui 4: Add, Checkbox,% " x" startX+765   " y"startY+25 " w"90 " h"25  " vCSP2Char"A_Index ,
	; Gui 4: Add, Checkbox,% " x" startX+865   " y"startY+25 " w"90 " h"25  " vCSP3Char"A_Index ,
	; Gui 4: Add, Checkbox,% " x" startX+965   " y"startY+25 " w"90 " h"25  " vCSP4Char"A_Index ,


startY := startY +60

IniWrite,% SwitchCharKey%myCharName%,charManager.ini,Characters,% val.name

key := SwitchCharKey%myCharName%


if(key!="ERROR" && key!=""){
	Hotkey, % SwitchCharKey%myCharName%, myChickenKey	
}
}Hotkey IfWinActive,

Gui 4: Add, BUTTON,% " x" startX   " y"startY+25 " w"95 " h"25 " gChickenFactorySave", SAVE
Gui 4: Show,, Chicken Factory
gosub CheckCheckboxes
return

CheckCheckboxes:

for key,val in nicknames {
	
	if(beepArray[val.name]){
	GuiControl,4:,BeepChar%A_Index%,1
} else {
		GuiControl,4:,BeepChar%A_Index%,0
}
	
if(LootArray[val.name]){
	GuiControl,4:,LootChar%A_Index%,1
} else {
		GuiControl,4:,LootChar%A_Index%,0
}
	}
	
return

myChickenKey:
for key,val in Nicknames {
	myCharName := val.pid
	if(SwitchCharKey%myCharName% = A_ThisHotKey){
		WinActivate,% "ahk_pid" val.pid
		ColorActiveChar()
	return
	}
}
return

ChickenFactorySave:
Gui 4:Submit, NoHide
Hotkey IfWinActive, ahk_exe Dofus*
for key, val in Nicknames {
	myCharName := val.pid
IniWrite,% SwitchCharKey%myCharName%,charManager.ini,Characters,% val.name
IniRead,SwitchCharKey%myCharName%,charManager.ini,Characters,% val.name

IniWrite,% BeepChar%A_Index%,charManager.ini,Beep,% val.name
IniRead,BeepChar%A_Index%,charManager.ini,Beep,% val.name


IniWrite,% LootChar%A_Index%,charManager.ini,Loot,% val.name
IniRead,LootChar%A_Index%,charManager.ini,Loot,% val.name


/*
beepArray[val.name]:= BeepChar%A_Index%
LootArray[val.name]:= LootChar%A_Index%
CupiditeArray[val.name]:= CupiditeChar%A_Index%
ChanceArray[val.name]:= ChanceChar%A_Index%
ChestArray[val.name]:= CoffreChar%A_Index%
CSP1Array[val.name]:= CSP1Char%A_Index%
CSP2Array[val.name]:= CSP2Char%A_Index%
CSP3Array[val.name]:= CSP3Char%A_Index%
CSP4Array[val.name]:= CSP4Char%A_Index%
*/

LootArray[val.name]:= LootChar%A_Index%


key := SwitchCharKey%myCharName%
if(key!="ERROR" && key!=""){
	Hotkey, % SwitchCharKey%myCharName%, myChickenKey	
	}
}



Hotkey IfWinActive
    MsgBox,, HEY BABE, SAVING ... , 0.5
	
	Gui 4: Hide
return

Donate:
Run, https://github.com/Space-Cowb0y
return

HideEverything:
Gui,Submit,NoHide
boolPage1 := !boolPage1
if(boolPage1){
	
	GuiControl,Show,listview1
	GuiControl,Show,listview2
	GuiControl,Show,AddAccToFile
	GuiControl,Show,EditFileButton
	GuiControl,Show,Mdp
	GuiControl,Show,Id
	GuiControl,Show,Text1
	GuiControl,Show,Text2
	GuiControl,Show,Text3
	GuiControl,Show,Text4
	GuiControl,Show,Text5
	GuiControl,Show,TeamName
	GuiControl,Show,Button0
	GuiControl,Show,Button1
	GuiControl,Show,Button2
	GuiControl,Show,TextSonic
	GuiControl,Show,check1
	GuiControl,Show,check2

	GuiControl,Hide,GroupBoxLogin
	GuiControl,Hide,AutoLogInDelay
	
	GuiControl,Hide,StartDofusDelay
	GuiControl,Hide,IdPosX
	GuiControl,Hide,IdPosY
	GuiControl,Hide,AutoLogInDelay
	GuiControl,Hide,EnableSniper
	
	GuiControl,Hide,Slot1Pos
	GuiControl,Hide,Slot2Pos
	GuiControl,Hide,Slot3Pos
	GuiControl,Hide,Slot4Pos
	GuiControl,Hide,Slot5Pos
	GuiControl,Hide,AutoSelect
	GuiControl,Hide,AutoSelectDela
	
	GuiControl,Hide, Text10
	GuiControl,Hide,Text11
	GuiControl,Hide,Text12
	GuiControl,Hide,Text13
	GuiControl,Hide,Text14
	GuiControl,Hide,Text15
	
	GuiControl,Hide,Text16
	GuiControl,Hide,Text17
	GuiControl,Hide,Text18
	GuiControl,Hide,Text19
	GuiControl,Hide,Text20
	GuiControl,Hide,Text21
	GuiControl,Hide,Text22

		
	GuiControl,Hide,Text24

	GuiControl,Hide,Text26

	GuiControl,Hide,AutoLogInDelayBetweenServerAndCharacter
	GuiControl,Hide,AutoLogInDelayBetweenLogAndServer
	GuiControl,Hide,DelayClickAfterLoadingScreen

	

	for key,val in account{
			GuiControl,Hide,AccountNumber%A_Index%
	GuiControl,Hide,AccountText%A_Index%
	GuiControl,Hide,SaveCharButton
	
		GuiControl,Hide,AccountServerSlotTxt%A_Index%
	GuiControl,Hide,AccountServerSlot%A_Index%
	
	GuiControl,Hide,AccountCharSlotTxt%A_Index%
	GuiControl,Hide,AccountCharSlot%A_Index%
}

	
} else {
GuiControl,Hide,listview1
	GuiControl,Hide,listview2
	GuiControl,Hide,AddAccToFile
	GuiControl,Hide,EditFileButton
	GuiControl,Hide,Mdp
	GuiControl,Hide,Id
	GuiControl,Hide,Text1
	GuiControl,Hide,Text2
	GuiControl,Hide,Text3
	GuiControl,Hide,Text4
	GuiControl,Hide,Text5
	GuiControl,Hide,TeamName
	GuiControl,Hide,Button0
	GuiControl,Hide,Button1
	GuiControl,Hide,Button2
	GuiControl,Hide,check1
	GuiControl,Hide,check2

		GuiControl,Hide,GroupBoxLogin
	GuiControl,Hide,AutoLogInDelay
	
	GuiControl,Hide,StartDofusDelay
	GuiControl,Hide,IdPosX
	GuiControl,Hide,IdPosY
	GuiControl,Hide,AutoLogInDelay
	GuiControl,Hide,EnableSniper
	
	GuiControl,Hide,Slot1Pos
	GuiControl,Hide,Slot2Pos
	GuiControl,Hide,Slot3Pos
	GuiControl,Hide,Slot4Pos
	GuiControl,Hide,Slot5Pos
	GuiControl,Hide,AutoSelect
	GuiControl,Hide,AutoSelectDela
	
	GuiControl,Hide, Text10
	GuiControl,Hide,Text11
	GuiControl,Hide,Text12
	GuiControl,Hide,Text13
	GuiControl,Hide,Text14
	GuiControl,Hide,Text15
	
	GuiControl,Hide,Text16
	GuiControl,Hide,Text17
	GuiControl,Hide,Text18
	GuiControl,Hide,Text19
	GuiControl,Hide,Text20
	GuiControl,Hide,Text21
	GuiControl,Hide,Text22
	GuiControl,Hide,Text23
	
		
	GuiControl,Hide,Text24
	GuiControl,Hide,Text25
	GuiControl,Hide,Text26
	GuiControl,Hide,SwitchPage2

	GuiControl,Hide,AutoLogInDelayBetweenServerAndCharacter
	GuiControl,Hide,AutoLogInDelayBetweenLogAndServer
	GuiControl,Hide,AutoLogInDelayBetweenServerAndCharacter

	
	
	for key,val in account{
			GuiControl,Show,AccountNumber%A_Index%
	GuiControl,Show,AccountText%A_Index%
	GuiControl,Show,SaveCharButton
	
	GuiControl,Show,AccountServerSlotTxt%A_Index%
	GuiControl,Show,AccountServerSlot%A_Index%
	
	GuiControl,Show,AccountCharSlotTxt%A_Index%
	GuiControl,Show,AccountCharSlot%A_Index%
	
}
}

;Gui, Add, BUTTON,% " x" startX   " y"startY+30 " w"95 " h"25 " gSaveChar" " vSaveCharButton", SAVE

	GuiControlGet,SwitchPage
	if(SwitchPage == "Auto Pairing - Link Char"){
	GuiControl,,SwitchPage, Save and back
	} else {
			GuiControl,Show,SwitchPage2
			gosub savekeys
		gosub SaveChar
		GuiControl,,SwitchPage,Auto Pairing - Link Char
}
return


HideEverything2:
Gui,Submit,NoHide
boolPage1 := !boolPage1
if(boolPage1){
	
		GuiControl,Show,listview1
	GuiControl,Show,listview2
	GuiControl,Show,AddAccToFile
	GuiControl,Show,EditFileButton
	GuiControl,Show,Mdp
	GuiControl,Show,Id
	GuiControl,Show,Text1
	GuiControl,Show,Text2
	GuiControl,Show,Text3
	GuiControl,Show,Text4
	GuiControl,Show,Text5
	GuiControl,Show,TeamName
	GuiControl,Show,Button0
	GuiControl,Show,Button1
	GuiControl,Show,Button2
	GuiControl,Show,TextSonic
	GuiControl,Show,check1
	GuiControl,Show,check2

		GuiControl,Hide,GroupBoxLogin
	GuiControl,Hide,AutoLogInDelay
	
	GuiControl,Hide,StartDofusDelay
	GuiControl,Hide,IdPosX
	GuiControl,Hide,IdPosY
	GuiControl,Hide,AutoLogInDelay
	GuiControl,Hide,EnableSniper
	
	GuiControl,Hide,Slot1Pos
	GuiControl,Hide,Slot2Pos
	GuiControl,Hide,Slot3Pos
	GuiControl,Hide,Slot4Pos
	GuiControl,Hide,Slot5Pos
	GuiControl,Hide,AutoSelect
	GuiControl,Hide,AutoSelectDela
	
	GuiControl,Hide, Text10
	GuiControl,Hide,Text11
	GuiControl,Hide,Text12
	GuiControl,Hide,Text13
	GuiControl,Hide,Text14
	GuiControl,Hide,Text15
	
	GuiControl,Hide,Text16
	GuiControl,Hide,Text17
	GuiControl,Hide,Text18
	GuiControl,Hide,Text19
	GuiControl,Hide,Text20
	GuiControl,Hide,Text21
	GuiControl,Hide,Text22
	GuiControl,Hide,Text23

	GuiControl,Show,SwitchPage2

	

	for key,val in account{
			GuiControl,Hide,AccountNumber%A_Index%
	GuiControl,Hide,AccountText%A_Index%
	GuiControl,Hide,SaveCharButton
}

	
} else {
GuiControl,Hide,listview1
	GuiControl,Hide,listview2
	GuiControl,Hide,AddAccToFile
	GuiControl,Hide,EditFileButton
	GuiControl,Hide,Mdp
	GuiControl,Hide,Id
	GuiControl,Hide,Text1
	GuiControl,Hide,Text2
	GuiControl,Hide,Text3
	GuiControl,Hide,Text4
	GuiControl,Hide,Text5
	GuiControl,Hide,TeamName
	GuiControl,Hide,Button0
	GuiControl,Hide,Button1
	GuiControl,Hide,Button2
	GuiControl,Hide,check1
	GuiControl,Hide,check2

	
	
	;shoow 
	
	
	GuiControl,Show,GroupBoxLogin
	GuiControl,Show,AutoLogInDelay
	
	GuiControl,Show,StartDofusDelay
	GuiControl,Show,IdPosX
	GuiControl,Show,IdPosY
	GuiControl,Show,AutoLogInDelay
	GuiControl,Show,EnableSniper
	
	GuiControl,Show,Slot1Pos
	GuiControl,Show,Slot2Pos
	GuiControl,Show,Slot3Pos
	GuiControl,Show,Slot4Pos
	GuiControl,Show,Slot5Pos
	GuiControl,Show,AutoSelect
	GuiControl,Show,AutoSelectDela
	
	GuiControl,Show,Text10
	GuiControl,Show,Text11
	GuiControl,Show,Text12
	GuiControl,Show,Text13
	GuiControl,Show,Text14
	GuiControl,Show,Text15
	
	GuiControl,Show,Text16
	GuiControl,Show,Text17
	GuiControl,Show,Text18
	GuiControl,Show,Text19
	GuiControl,Show,Text20
	GuiControl,Show,Text21
	GuiControl,Show,Text22
	GuiControl,Show,Text23
	GuiControl,Hide,SwitchPage2
	
	GuiControl,Show,Text24
	GuiControl,Show,Text25
	GuiControl,Show,Text26
	
	
	GuiControl,Show,DelayClickAfterLoadingScreen
	GuiControl,Show,AutoLogInDelayBetweenLogAndServer
	GuiControl,Show,AutoLogInDelayBetweenServerAndCharacter
	
	
	
}

	GuiControlGet,SwitchPage
	if(SwitchPage == "Auto Pairing - Link Char"){
	GuiControl,,SwitchPage, Save and back
	
	} else {

		GuiControl,,SwitchPage,Auto Pairing - Link Char
		
}
return


showGUI:
Gui, Show, w%GUIsizeW% h%GUIsizeH%, DPF__cracked_by_rigwild__Mod____by__SpaceCowb0y
return

SaveChar:

for key, val in account {
	GuiControlGet,AccountNumber%A_index%
	GuiControlGet,AccountServerSlot%A_Index%
	GuiControlGet,AccountCharSlot%A_Index%
	

	IniWrite,% AccountNumber%A_index%, pairing.ini,Accounts,%key%
	IniWrite,% AccountServerSlot%A_index%, pairing.ini,Accounts,% AccountNumber%A_index% "Server"

	
	IniWrite,% AccountCharSlot%A_index%, pairing.ini,Accounts,% AccountNumber%A_index% "Char"
}


return


containsValueInArray(arr,value){
	for key, val in arr {
		if(val==value){
	
		return true	
		}
}
return false
}

getDofusWindowsName(){
dofusWindowsName := array()
WinGet windows, List
Loop %windows%
{
	id := windows%A_Index%
	WinGet, activeprocess, ProcessName, ahk_id %id%
	
	If (InStr(activeprocess, "Dofus Retro.exe") || InStr(activeprocess, "Dofus.exe"))
	{
	WinGet, var, PID, ahk_id %id%
	WinGetTitle, varTitle,ahk_id %id%
	  dofusWindowsName.Push(varTitle)

	}
}

}

myRappelKey:
		for key,val in Nicknames {
	
		ControlSend,,{%PopoRappelKey%} , % "ahk_pid" val.pid
	Sleep %PopoRappelKey%
			
}
return

myBontaKey:
		for key,val in Nicknames {
		
		ControlSend,,{%PopoBontaKey%},  % "ahk_pid" val.pid
		Sleep %PopoBontaDelay%
}
return

myBrakmarKey:

		for key,val in Nicknames {

		ControlSend,,{%PopoBrakmarKey%},  % "ahk_pid" val.pid
Sleep %PopoBrakmarDelay%
}
return

myBreadKey:
MouseGetPos,startXpos, startYpos,,0
for key,val in nicknames {
ControlClick,% "x"breadX " y"breadY,% "ahk_pid" val.pid,, left,4
Sleep %BreadDelay%
}

return

myMessage1Key:

GuiControlGet,CustomTText1
Clipboard:=CustomTText1
Send, {enter}
Send, ^v
Send, {enter}


return

myMessage2Key:
GuiControlGet,CustomTText2
Clipboard:=CustomTText2
Send, {enter}
Send, ^v
Send, {enter}

return

myMessage3Key:
GuiControlGet,CustomTText3
Clipboard:=CustomTText3
Send, {enter}
Send, ^v
Send, {enter}

return


OpenJebaited:

run, https://www.youtube.com/watch?v=oGJr5N2lgsQ
return


<^>!a::
SetPos("IdX","IdY","AutoLogIn")
return


<^>!z::
SetPos("PwX","PwY","AutoLogIn")
return

<^>!e::
SetPos("ReadyButtonX","ReadyButtonY","AutoReady")
return

<^>!r::
SetPos("PairingChatPositionX","PairingChatPositionY","Pairing")
return


<^>!t::
SetPos("NameTurnPosX1","NameTurnPosY1","AutoSwitch")
return

<^>!y::
SetPos("NameTurnPosX2","NameTurnPosY2","AutoSwitch")
return

<^>!u::
SetPos("TurnIndicatorPosX1","TurnIndicatorPosY1","AutoBuff")
return


<^>!i::
SetPos("TurnIndicatorPosX2","TurnIndicatorPosY2","AutoBuff")
return


<^>!o::
SetPos("WholeMapPosX1","WholeMapPosY1","AutoBuff")
return


<^>!p::
SetPos("WholeMapPosX2","WholeMapPosY2","AutoBuff")
return


<^>!q::
SetPosAndGetColor("TradeAcceptButtonX1","TradeAcceptButtonY1","AutoTrade")
return

<^>!s::
SetPos("TradeNamePosX1","TradeNamePosY1","AutoTrade")
return

<^>!d::
SetPos("TradeNamePosX2","TradeNamePosY2","AutoTrade")
return

<^>!f::
SetPos("EndFightIndicatorPosX1","EndFightIndicatorPosY1","EndFightIndicatorPosition")
return

<^>!g::
SetPos("Slot1X","Slot1Y","Slot")
return

<^>!h::
SetPos("Slot2X","Slot2Y","Slot")
return

<^>!j::
SetPos("Slot3X","Slot3Y","Slot")
return

<^>!k::
SetPos("Slot4X","Slot4Y","Slot")
return

<^>!l::
SetPos("Slot5X","Slot5Y","Slot")
return

<^>!m::
SetPos("BreadX","BreadY","AutoBread")
return



controlgui:


Gui 6:Color, c%ControlGUIBackgroundColor%
Gui 6:Font, s%ControlGUIFontSize% c%ControlGUIFontColor%, %ControlGUIFont%
Gui 6:Font, bold
GUI 6:+alwaysontop 


Gui 6: Add, GroupBox,xm+%groupBoxSwitchX% ym+%groupBoxSwitchY% Section w%GroupBoxSizeW% h%GroupBoxSizeH% vGroupBoxSwitch,% "A-Switch"
Gui 6: Add, Text,vSwitchTextTemp,% "ON"
GuiControlGet,Texto,6: Pos,SwitchTextTemp
GuiControl,6:Hide,SwitchTextTemp
SwitchOnOffX:= (GroupBoxSizeW - TextoW)/2 + SwitchOnOffCustomX
SwitchOnOffY := ((GroupBoxSizeH - TextoH)/2) + Ceil(TextoH/3)  + SwitchOnOffCustomY
Gui 6: Add, Text,xs+%SwitchOnOffX% ys+%SwitchOnOffY% vSwitchText,% "ON "


Gui 6: Add, GroupBox,xm+%groupBoxSkipX% ym+%groupBoxSkipY% Section w%GroupBoxSizeW% h%GroupBoxSizeH% vGroupBoxSkip,% "A-Skip"
Gui 6: Add, Text,vSkipTextTemp,% "ON"
GuiControlGet,Texto,6: Pos,SkipTextTemp
GuiControl,6:Hide,SkipTextTemp
SkipOnOffX:= (GroupBoxSizeW - TextoW)/2 + SkipOnOffCustomX
SkipOnOffY := ((GroupBoxSizeH - TextoH)/2) + Ceil(TextoH/3)  + SkipOnOffCustomY
Gui 6: Add, Text,xs+%SkipOnOffX% ys+%SkipOnOffY% vSkipText,% "ON "



Gui 6: Add, GroupBox,xm+%groupBoxTradeX% ym+%groupBoxTradeY% Section w%GroupBoxSizeW% h%GroupBoxSizeH% vGroupBoxTrade,% "A-Trade"
Gui 6: Add, Text,vTradeTextTemp,% "ON"
GuiControlGet,Texto,6: Pos,TradeTextTemp
GuiControl,6:Hide,TradeTextTemp
TradeOnOffX:= (GroupBoxSizeW - TextoW)/2 + TradeOnOffCustomX
TradeOnOffY := ((GroupBoxSizeH - TextoH)/2) + Ceil(TextoH/3)  + TradeOnOffCustomY
Gui 6: Add, Text,xs+%TradeOnOffX% ys+%TradeOnOffY% vTradeText,% "ON "




Gui 6: Add, GroupBox,xm+%groupBoxLootX% ym+%groupBoxLootY% Section w%GroupBoxSizeW% h%GroupBoxSizeH% vGroupBoxLoot,% "A-Loot"
Gui 6: Add, Text,vLootTextTemp,% "ON"
GuiControlGet,Texto,6: Pos,LootTextTemp
GuiControl,6:Hide,LootTextTemp
LootOnOffX:= (GroupBoxSizeW - TextoW)/2 + LootOnOffCustomX
LootOnOffY := ((GroupBoxSizeH - TextoH)/2) + Ceil(TextoH/3)  + LootOnOffCustomX
Gui 6: Add, Text,xs+%LootOnOffX% ys+%LootOnOffY% vLootText,% "ON "


Gui 6: Add, GroupBox,xm+%groupBoxCFX% ym+%groupBoxCFY% Section w%groupBoxCFSizeW% h%groupBoxCFSizeH% vGroupBoxChickenFactory,
Gui 6: Add, Text,vCFTextTemp,% "Chicken Factory"
GuiControlGet,Texto,6: Pos,CFTextTemp
GuiControl,6:Hide,CFTextTemp
CFCustomX:= (groupBoxCFSizeW - TextoW)/2 + CFX
CFCustomY := ((groupBoxCFSizeH - TextoH)/2) + Ceil(TextoH/3)  + CFY
Gui 6: Add, Text,xs+%CFCustomX% ys+%CFCustomY%,% "Chicken Factory"




if(boolSwitch){
		Gui,6:  Font, s%ControlGUIFontOnOffSize% c%ControlGUIFontOnColor%
		GuiControl,6: Font,SwitchText,
		GuiControl,6: Text,SwitchText,% "ON"
}else {
		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOffColor%
		GuiControl,6: Font,SwitchText,	
		GuiControl,6: Text,SwitchText, % "OFF  "
}


if(boolSkip){

		Gui,6:  Font, s%ControlGUIFontOnOffSize% c%ControlGUIFontOnColor%
		GuiControl,6: Font,SkipText,
		GuiControl,6: Text,SkipText,% "ON"
}else {
		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOffColor%
		GuiControl,6: Font,SkipText,	
		GuiControl,6: Text,SkipText, % "OFF  "
}


if(boolLoot){

		Gui,6:  Font, s%ControlGUIFontOnOffSize% c%ControlGUIFontOnColor%
		GuiControl,6: Font,LootText,
		GuiControl,6: Text,LootText,% "ON"
}else {
		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOffColor%
		GuiControl,6: Font,LootText,	
		GuiControl,6: Text,LootText, % "OFF  "
}
if(boolEchange){

		Gui,6:  Font, s%ControlGUIFontOnOffSize% c%ControlGUIFontOnColor%
		GuiControl,6: Font,TradeText,
		GuiControl,6: Text,TradeText,% "ON"
}else {
		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOffColor%
		GuiControl,6: Font,TradeText,	
		GuiControl,6: Text,TradeText, % "OFF  "
}


Gui 6:-Caption
Gui 6:Show,% "x"GuiControlPosX " y"GuiControlPosY " w" GuiControlWidth " h" GuiControlHeight " NoActivate" ,ControlGUI
OnMessage(0x0201, "WM_LBUTTONDOWN")
return


mySwitchKey:
boolSwitch := !boolSwitch
if(boolSwitch){
		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOnColor%
		GuiControl,6: Font,SwitchText,
		GuiControl,6: Text,SwitchText,% "ON"
}else {
		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOffColor%
		GuiControl,6: Font,SwitchText,	
		GuiControl,6: Text,SwitchText, % "OFF "
}

if(boolSwitch){
	SetTimer,mySwitchKeyA,
} else {
	SetTimer,mySwitchKeyA,off
}
return

mySkipKey:
boolSkip := !boolSkip
if(boolSkip){

		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOnColor%
		GuiControl,6: Font,SkipText,
		GuiControl,6: Text,SkipText,% "ON"
}else {
		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOffColor%
		GuiControl,6: Font,SkipText,	
		GuiControl,6: Text,SkipText, % "OFF  "
}
return

myTradeKey:
boolEchange := !boolEchange
if(boolEchange){

		Gui,6:  Font, s%ControlGUIFontOnOffSize% c%ControlGUIFontOnColor%
		GuiControl,6: Font,TradeText,
		GuiControl,6: Text,TradeText,% "ON"
}else {
		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOffColor%
		GuiControl,6: Font,TradeText,	
		GuiControl,6: Text,TradeText, % "OFF  "
}
return

myLootKey:
boolLoot := !boolLoot
if(boolLoot){

		Gui,6:  Font, s%ControlGUIFontOnOffSize% c%ControlGUIFontOnColor%
		GuiControl,6: Font,LootText,
		GuiControl,6: Text,LootText,% "ON"
}else {
		Gui,6:  Font,s%ControlGUIFontOnOffSize% c%ControlGUIFontOffColor%
		GuiControl,6: Font,LootText,	
		GuiControl,6: Text,LootText, % "OFF  "
}
return


#IfWinActive ControlGUI
~LButton::
CoordMode,Mouse,Client
GuiControlGet,SwitchPos,6: Pos,GroupBoxSwitch
GuiControlGet,SkipPos,6: Pos,GroupBoxSkip


GuiControlGet,ChickenFactoryPos,6: Pos,GroupBoxChickenFactory
GuiControlGet,TradePos,6: Pos,GroupBoxTrade
GuiControlGet,LootPos,6: Pos,GroupBoxLoot


SwitchPosX := Ceil(SwitchPosX*(A_ScreenDPI/96))
SwitchPosY := Ceil(SwitchPosY*(A_ScreenDPI/96))
SwitchPosW:= Ceil(SwitchPosW*(A_ScreenDPI/96))
SwitchPosH:= Ceil(SwitchPosH*(A_ScreenDPI/96))

SkipPosX := Ceil(SkipPosX*(A_ScreenDPI/96))
SkipPosY := Ceil(SkipPosY*(A_ScreenDPI/96))
SkipPosW := Ceil(SkipPosW*(A_ScreenDPI/96))
SkipPosH := Ceil(SkipPosH*(A_ScreenDPI/96))


ChickenFactoryPosX := Ceil(ChickenFactoryPosX*(A_ScreenDPI/96))
ChickenFactoryPosY := Ceil(ChickenFactoryPosY*(A_ScreenDPI/96))
ChickenFactoryPosW := Ceil(ChickenFactoryPosW*(A_ScreenDPI/96))
ChickenFactoryPosH := Ceil(ChickenFactoryPosH*(A_ScreenDPI/96))

TradePosX := Ceil(TradePosX*(A_ScreenDPI/96))
TradePosY := Ceil(TradePosY*(A_ScreenDPI/96))
TradePosW := Ceil(TradePosW*(A_ScreenDPI/96))
TradePosH := Ceil(TradePosH*(A_ScreenDPI/96))

LootPosX := Ceil(LootPosX*(A_ScreenDPI/96))
LootPosY := Ceil(LootPosY*(A_ScreenDPI/96))
LootPosW := Ceil(LootPosW*(A_ScreenDPI/96))
LootPosH := Ceil(LootPosH*(A_ScreenDPI/96))


MouseGetPos,x,y


if((x >= SwitchPosX && x <= SwitchPosX+SwitchPosW)) && (y >= SwitchPosY && y <= SwitchPosY+SwitchPosH){
	gosub mySwitchKey

}
if((x >= SkipPosX && x <= SkipPosX+SkipPosW)) && (y >= SkipPosY && y <= SkipPosY+SkipPosH){
	gosub mySkipKey
	
}

if((x >= LootPosX && x <= LootPosX+LootPosW)) && (y >= LootPosY && y <= LootPosY+LootPosH){
	gosub myLootKey

}

if((x >= TradePosX && x <= TradePosX+TradePosW)) && (y >= TradePosY && y <= TradePosY+TradePosH){
	gosub myTradeKey

}

 
if((x >= ChickenFactoryPosX && x <= ChickenFactoryPosX+ChickenFactoryPosW)) && (y >= ChickenFactoryPosY && y <= ChickenFactoryPosY+ChickenFactoryPosH){
	gosub ChickenFactory

}


#IfWinActive
return

readPartySettings(){

ReadSettings("OpenPartyGUIKey","PartyGUI","partyGUI.ini",OpenPartyGUIKey)
WriteSettings("OpenPartyGUIKey","PartyGUI","partyGUI.ini",OpenPartyGUIKey)

ReadSettings("PartyGUIW","PartyGUI","partyGUI.ini",PartyGUIW)
WriteSettings("PartyGUIW","PartyGUI","partyGUI.ini",PartyGUIW)

ReadSettings("PartyGUIH","PartyGUI","partyGUI.ini",PartyGUIH)
WriteSettings("PartyGUIH","PartyGUI","partyGUI.ini",PartyGUIH)

ReadSettings("PartyGUIX","PartyGUI","partyGUI.ini",PartyGUIX)
WriteSettings("PartyGUIX","PartyGUI","partyGUI.ini",PartyGUIX)

ReadSettings("PartyGUIY","PartyGUI","partyGUI.ini",PartyGUIY)
WriteSettings("PartyGUIY","PartyGUI","partyGUI.ini",PartyGUIY)



ReadSettings("PartyGUIPlayerDisableColor","PartyGUI","partyGUI.ini",PartyGUIPlayerDisableColor)
WriteSettings("PartyGUIPlayerDisableColor","PartyGUI","partyGUI.ini",PartyGUIPlayerDisableColor)

ReadSettings("PartyGUIPlayerSkipColor","PartyGUI","partyGUI.ini",PartyGUIPlayerSkipColor)
WriteSettings("PartyGUIPlayerSkipColor","PartyGUI","partyGUI.ini",PartyGUIPlayerSkipColor)

ReadSettings("PartyGUIBackgroundColor","PartyGUI","partyGUI.ini",PartyGUIBackgroundColor)
WriteSettings("PartyGUIBackgroundColor","PartyGUI","partyGUI.ini",PartyGUIBackgroundColor)


ReadSettings("PartyGUICurrentPlayerColor","PartyGUI","partyGUI.ini",PartyGUICurrentPlayerColor)
WriteSettings("PartyGUICurrentPlayerColor","PartyGUI","partyGUI.ini",PartyGUICurrentPlayerColor)

ReadSettings("PartyGUINameFont","PartyGUI","partyGUI.ini",PartyGUINameFont)
WriteSettings("PartyGUINameFont","PartyGUI","partyGUI.ini",PartyGUINameFont)

ReadSettings("PartyGUINameFontSize","PartyGUI","partyGUI.ini",PartyGUINameFontSize)
WriteSettings("PartyGUINameFontSize","PartyGUI","partyGUI.ini",PartyGUINameFontSize)

ReadSettings("PartyGUINameFontColor","PartyGUI","partyGUI.ini",PartyGUINameFontColor)
WriteSettings("PartyGUINameFontColor","PartyGUI","partyGUI.ini",PartyGUINameFontColor)

ReadSettings("PartyGUIButtonFontSize","PartyGUI","partyGUI.ini",PartyGUIButtonFontSize)
WriteSettings("PartyGUIButtonFontSize","PartyGUI","partyGUI.ini",PartyGUIButtonFontSize)

ReadSettings("PartyGUIOpenSizeW","PartyGUI","partyGUI.ini",PartyGUIOpenSizeW)
WriteSettings("PartyGUIOpenSizeW","PartyGUI","partyGUI.ini",PartyGUIOpenSizeW)

ReadSettings("PartyGUIOpenSizeH","PartyGUI","partyGUI.ini",PartyGUIOpenSizeH)
WriteSettings("PartyGUIOpenSizeH","PartyGUI","partyGUI.ini",PartyGUIOpenSizeH)


ReadSettings("PartyGUIDisableSizeW","PartyGUI","partyGUI.ini",PartyGUIDisableSizeW)
WriteSettings("PartyGUIDisableSizeW","PartyGUI","partyGUI.ini",PartyGUIDisableSizeW)

ReadSettings("PartyGUIDisableSizeH","PartyGUI","partyGUI.ini",PartyGUIDisableSizeH)
WriteSettings("PartyGUIDisableSizeH","PartyGUI","partyGUI.ini",PartyGUIDisableSizeH)


ReadSettings("PartyGUISkipSizeW","PartyGUI","partyGUI.ini",PartyGUISkipSizeW)
WriteSettings("PartyGUISkipSizeW","PartyGUI","partyGUI.ini",PartyGUISkipSizeW)

ReadSettings("PartyGUISkipSizeH","PartyGUI","partyGUI.ini",PartyGUISkipSizeH)
WriteSettings("PartyGUISkipSizeH","PartyGUI","partyGUI.ini",PartyGUISkipSizeH)

ReadSettings("NameStartY","PartyGUI","partyGUI.ini",NameStartY)
WriteSettings("NameStartY","PartyGUI","partyGUI.ini",NameStartY)

ReadSettings("NameStartX","PartyGUI","partyGUI.ini",NameStartX)
WriteSettings("NameStartX","PartyGUI","partyGUI.ini",NameStartX)

ReadSettings("buttonStartX","PartyGUI","partyGUI.ini",buttonStartX)
WriteSettings("buttonStartX","PartyGUI","partyGUI.ini",buttonStartX)


ReadSettings("distanceBetweenButtonOpenDisableX","PartyGUI","partyGUI.ini",distanceBetweenButtonOpenDisableX)
WriteSettings("distanceBetweenButtonOpenDisableX","PartyGUI","partyGUI.ini",distanceBetweenButtonOpenDisableX)

ReadSettings("distanceBetweenButtonDisableSkipX","PartyGUI","partyGUI.ini",distanceBetweenButtonDisableSkipX)
WriteSettings("distanceBetweenButtonDisableSkipX","PartyGUI","partyGUI.ini",distanceBetweenButtonDisableSkipX)

ReadSettings("distanceBetweenNameAndButtonY","PartyGUI","partyGUI.ini",distanceBetweenNameAndButtonY)
WriteSettings("distanceBetweenNameAndButtonY","PartyGUI","partyGUI.ini",distanceBetweenNameAndButtonY)

ReadSettings("distanceBetweenEachCharacterAndButton","PartyGUI","partyGUI.ini",distanceBetweenEachCharacterAndButton)
WriteSettings("distanceBetweenEachCharacterAndButton","PartyGUI","partyGUI.ini",distanceBetweenEachCharacterAndButton)	
}
 
;-------------------------------------------------------------------------------
; API Functions
;-------------------------------------------------------------------------------
;  
; SWP_Initialize( [ secret1, secret 2, ... , secret 8 ] )
; Fingerprint := SWP_GetPcFingerprint()
; UserOK      := SWP_IsUserAuthenticated( username, email, key )
; Key         := SWP_GenerateKey( username, email, fingerprint )
;
;-------------------------------------------------------------------------------
SWP_Initialize( mk0=0x11111111, mk1=0x22222222, mk2=0x33333333, mk3=0x44444444
    ,ml0=0x12345678, ml1=0x12345678, mm0=0x87654321, mm1=0x87654321 ) {
    
    Global

    k0 := mk0                  ; 128-bit secret key (example)
    k1 := mk1
    k2 := mk2
    k3 := mk3
    
    l0 := ml0                  ; 64- bit 2nd secret key (example)
    l1 := ml1
    
    m0 := mm0                  ; 64- bit 3rd secret key (example)
    m1 := mm1

}


SWP_GetPcFingerprint() {
	Username := A_UserName
	StringReplace Username, Username,%A_Space%, , All
	StringReplace Username, Username,-, , All
	StringReplace Username, Username,., , All
	StringReplace Username, Username,!, , All
	StringReplace Username, Username,', , All
    PCdata = %COMPUTERNAME%%HOMEPATH%%Username%%PROCESSOR_ARCHITECTURE%%PROCESSOR_IDENTIFIER%
    PCdata = %PCdata%%PROCESSOR_LEVEL%%PROCESSOR_REVISION%%A_OSType%%A_OSVersion%%Language%

    Fingerprint := XCBC(Hex(PCdata,StrLen(PCdata)), 0,0, 0,0,0,0, 1,1, 2,2)
    Return Fingerprint
}

SWP_GenerateKey( username,fingerprint ) {
    Global k0,k1,k2,k3,l0,l1,m0,m1
    
    If( not k0 ) {
        MsgBox 16,Error,Error in SWP_GenerateKey - values are not initialized.`nPlease call SWP_Initialize() first.
        Return false
    }
        
    Together = %username%%fingerprint%
    Auth := XCBC(Hex(Together,StrLen(Together)), 0,0, k0,k1,k2,k3, l0,l1, m0,m1)
    Return Auth
}


SWP_IsUserAuthenticated( username, key ) {
    Global k0,k1,k2,k3,l0,l1,m0,m1
    
    If( not k0 ) {
        MsgBox 16,Error,Error in SWP_IsUserAuthenticated - values are not initialized.`nPlease call SWP_Initialize() first.
        Return false
    }
	Username := A_UserName
	StringReplace Username, Username,%A_Space%, , All
	StringReplace Username, Username,-, , All
	StringReplace Username, Username,., , All
	StringReplace Username, Username,', , All
		StringReplace Username, Username,!, , All
    Fingerprint := SWP_GetPcFingerprint()
    Together = %username%%Fingerprint%

    AuthData := XCBC(Hex(Together,StrLen(Together)), 0,0, k0,k1,k2,k3, l0,l1, m0,m1)
    Return Key=AuthData
}




;-------------------------------------------------------------------------------
; Internal Functions by Laszlo
;-------------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; TEA cipher ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Block encryption with the TEA cipher
; [y,z] = 64-bit I/0 block
; [k0,k1,k2,k3] = 128-bit key
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TEA(ByRef y,ByRef z, k0,k1,k2,k3)
{                                   ; need  SetFormat Integer, D
   s = 0
   d = 0x9E3779B9
   Loop 32                          ; could be reduced to 8 for speed
   {
      k := "k" . s & 3              ; indexing the key
      y := 0xFFFFFFFF & (y + ((z << 4 ^ z >> 5) + z  ^  s + %k%))
      s := 0xFFFFFFFF & (s + d)  ; simulate 32 bit operations
      k := "k" . s >> 11 & 3
      z := 0xFFFFFFFF & (z + ((y << 4 ^ y >> 5) + y  ^  s + %k%))
   }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; XCBC-MAC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; x  = long hex string input
; [u,v] = 64-bit initial value (0,0)
; [k0,k1,k2,k3] = 128-bit key
; [l0,l1] = 64-bit key for not padded last block
; [m0,m1] = 64-bit key for padded last block
; Return 16 hex digits (64 bits) digest
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

XCBC(x, u,v, k0,k1,k2,k3, l0,l1, m0,m1)
{
   Loop % Ceil(StrLen(x)/16)-1   ; full length intermediate message blocks
      XCBCstep(u, v, x, k0,k1,k2,k3)

   If (StrLen(x) = 16)              ; full length last message block
   {
      u := u ^ l0                   ; l-key modifies last state
      v := v ^ l1
      XCBCstep(u, v, x, k0,k1,k2,k3)
   }
   Else {                           ; padded last message block
      u := u ^ m0                   ; m-key modifies last state
      v := v ^ m1
      x = %x%100000000000000
      XCBCstep(u, v, x, k0,k1,k2,k3)
   }
   Return Hex8(u) . Hex8(v)         ; 16 hex digits returned
}

XCBCstep(ByRef u, ByRef v, ByRef x, k0,k1,k2,k3)
{
   StringLeft  p, x, 8              ; Msg blocks
   StringMid   q, x, 9, 8
   StringTrimLeft x, x, 16
   p = 0x%p%
   q = 0x%q%
   u := u ^ p
   v := v ^ q
   TEA(u,v,k0,k1,k2,k3)
}

Hex8(i)                             ; 32-bit integer -> 8 hex digits
{
   format = %A_FormatInteger%       ; save original integer format
   SetFormat Integer, Hex
   i += 0x100000000                 ; convert to hex, set MS bit
   StringTrimLeft i, i, 3           ; remove leading 0x1
   SetFormat Integer, %format%      ; restore original format
   Return i
}

Hex(ByRef b, n=0)                   ; n bytes data -> stream of 2-digit hex
{                                   ; n = 0: all (SetCapacity can be larger than used!)
   format = %A_FormatInteger%       ; save original integer format
   SetFormat Integer, Hex           ; for converting bytes to hex

   m := VarSetCapacity(b)
   If (n < 1 or n > m)
       n := m
   Loop %n%
   {
      x := 256 + *(&b+A_Index-1)    ; get byte in hex, set 17th bit
      StringTrimLeft x, x, 3        ; remove 0x1
      h = %h%%x%
   }
   SetFormat Integer, %format%      ; restore original format
   Return h
}

/*
F6::
MouseGetPos,x,y
PixelGetColor,color,x,y
MsgBox % color
Clipboard := color
return
*/

#If WinActive("ahk_exe Dofus Retro.exe") || WinActive("ahk_exe Dofus.exe")
^left::
boolChangeMap := !boolChangeMap
if(boolChangeMap){
	MsgBox, 0, Auto Change Map, Auto Change Map - ON, 0.5

}else {
	MsgBox, 0, Auto Change Map, Auto Change Map - OFF, 0.5
}
return
#IfWinActive

#If WinActive("ahk_exe Dofus Retro.exe") || WinActive("ahk_exe Dofus.exe")
^right::
boolChangeMap := !boolChangeMap
if(boolChangeMap){
	MsgBox, 0, Auto Change Map, Auto Change Map - ON, 0.5

}else {
	MsgBox, 0, Auto Change Map, Auto Change Map - OFF, 0.5
}
return
#IfWinActive

#If WinActive("ahk_exe Dofus Retro.exe") || WinActive("ahk_exe Dofus.exe")
^up::
boolChangeMap := !boolChangeMap
if(boolChangeMap){
	MsgBox, 0, Auto Change Map, Auto Change Map - ON, 0.5

}else {
	MsgBox, 0, Auto Change Map, Auto Change Map - OFF, 0.5
}
return
#IfWinActive

myLeftKey:
if(boolChangeMap){
PixelSearch, OutputVarX, OutputVarY, WholeMapPosX1-50, WholeMapPosY1, WholeMapPosX1+50,WholeMapPosY2,%mapColor%,3,fast
if(ErrorLevel=0){
	MouseClick,Left,OutputVarX,OutputVarY
	gosub, myMoveKey
}
}
return

myRightKey:
if(boolChangeMap){
	
PixelSearch, OutputVarX, OutputVarY, WholeMapPosX2-50, WholeMapPosY1, WholeMapPosX2+50,WholeMapPosY2,%mapColor%,3,fast
if(ErrorLevel=0){
	MouseClick,Left,OutputVarX,OutputVarY
	gosub, myMoveKey
}
}
return

myTopKey:
if(boolChangeMap){
	
PixelSearch, OutputVarX, OutputVarY, WholeMapPosX1, WholeMapPosY1-50, WholeMapPosX2,WholeMapPosY1+100,%mapColor%,3,fast
if(ErrorLevel=0){
	MouseClick,Left,OutputVarX,OutputVarY
	gosub, myMoveKey
}
}
return

myBottomKey:
if(boolChangeMap){
	
PixelSearch, OutputVarX, OutputVarY, WholeMapPosX1, WholeMapPosY2-40, WholeMapPosX2,WholeMapPosY2+50,%mapColor%,3,fast
if(ErrorLevel=0){
	MouseClick,Left,OutputVarX,OutputVarY
	gosub, myMoveKey
}
}
return



!^s::
Nicknames := array()
disabledChar := array()
	gosub myswitchtabkey
	
loop, % HowManyDofusOpen(){
		
	Send, {Enter}
	Sleep 100
	Send, /selection on
	Sleep 100
	Send, {Enter}
	Sleep 100
	Send, /whoami
	Sleep 100
	Send, {Enter}
	Sleep 100
	MouseClick,left,PairingchatPositionX,PairingchatPositionY,,0
	sleep 50
	MouseClick,left,PairingchatPositionX,PairingchatPositionY,,0
	Sleep 50
	Send, ^a
	Sleep 200
	Send, ^c
	Sleep,50
	Send, ^c
	Sleep,200
	
	

	Loop, parse, clipboard, `n, `r
{

	If InStr(A_LoopField, "se trouve") or InStr(A_LoopField, "está aqui") or InStr(A_LoopField, "befindet sich") or InStr(A_LoopField, "can be found") or InStr(A_LoopField, "está en") or InStr(A_LoopField, "is in het") or InStr(A_LoopField, "si trova") 
	{
		
	
	 lineContainingNickname := A_LoopField
	
	 
	 EndPos := InStr(lineContainingNickname, " ")-1
	 Nickname := SubStr(lineContainingNickname, 1, EndPos)
	 
	 WinGet, var, PID, A
	 pid := var

	 Nicknames.push(new NicknamesPaired(nickname,var))
	 break
	 Tooltip, DON'T TOUCH ANYTHING !  ,ChatX,ChatY-100
	} else If InStr(A_LoopField, ", et je me trouve"){
		
		 lineContainingNickname := A_LoopField
	
	
	 
	 
	 StartPos := InStr(lineContainingNickname, "suis")-1
	 EndPos := InStr(lineContainingNickname,"(")-1
	 Yep := EndPos-StartPos
	 Nickname := SubStr(lineContainingNickname, StartPos+6, Yep-6)

	 WinGet, var, PID, A
	 pid := var
	  Nicknames.push(new NicknamesPaired(nickname,var))
	
		
}
}

WinWaitActive, ahk_pid %var%
WinSetTitle, %Nickname%

	gosub myswitchtabkey
Sleep %PairingDelay%
}

Tooltip,
Gui 2: Destroy
goto, PartyGUI
return
ExitApp
#SingleInstance off
