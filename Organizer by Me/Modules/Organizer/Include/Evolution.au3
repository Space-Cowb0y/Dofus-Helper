#Include-Once

; ### Region Fonctions de mise à niveau des fichiers

Func upgrade_to_current_version()
	DirCreate(".\Organizer")
	FileInstall(".\Organizer\_Organizer.ini", ".\Organizer\Organizer.ini", 0)
	If Not FileExists(ORGANIZER_config_file()) Then
		FileClose(FileOpen(ORGANIZER_config_file(),10))
	EndIf
	_upgrade_to_1_0()
	_upgrade_to_1_1a()
	_upgrade_to_1_2()
	_upgrade_to_1_2a()
	_upgrade_to_1_3()
	_upgrade_to_1_3a()
	_upgrade_to_1_3b()
	_upgrade_to_1_4()
	_upgrade_to_1_5()
	_upgrade_to_1_5a()
	_upgrade_to_1_5b()
EndFunc

#Region Fonctions internes au fichier

; Mise à niveau "from scratch" vers 1.0

Func _upgrade_to_1_0()
	Local $next_version = "1.0"
	; Configuration générale
	_doNothingButVersion($next_version)
EndFunc

; Mise à niveau vers 1.1a

Func _upgrade_to_1_1a()
	Local $next_version = "1.1a"
	; Configuration générale
	If compareVersion(_upgrade_readVersion(ORGANIZER_config_file()), $next_version) < 0 Then
		IniWrite(ORGANIZER_config_file(), "", "Version", $next_version)
		FileInstall(".\Organizer\Language\Language.ini", ".\Organizer\Language\Language.ini", 1)
		Local $patternData = "^(\d+)¶([^¶]*)¶([^¶]*)$"
		Local $sections = IniReadSectionNames(ORGANIZER_config_file())
		If Not @error Then
			For $i = 1 To $sections[0]
				Local $section = IniReadSection(ORGANIZER_config_file(), $sections[$i])
				If Not @error Then
					For $j = 1 To $section[0][0]
						If StringRegExp($section[$j][0], "^_") And StringRegExp($section[$j][1], $patternData) Then
							Local $order     = StringRegExpReplace($section[$j][1], $patternData, "$1")
							Local $shortcut  = StringRegExpReplace($section[$j][1], $patternData, "$2")
							Local $icon      = StringRegExpReplace($section[$j][1], $patternData, "$3")
							IniWrite(ORGANIZER_config_file(), $sections[$i], $section[$j][0], $order&"¶"&"1"&"¶"&$shortcut&"¶"&$icon)
						EndIf
					Next
				EndIf
			Next
		EndIf
	EndIf
EndFunc

; Mise à niveau vers 1.2

Func _upgrade_to_1_2()
	Local $next_version = "1.2"
	; Configuration générale
	_doNothingButVersion($next_version)
EndFunc

; Mise à niveau vers 1.2a

Func _upgrade_to_1_2a()
	Local $next_version = "1.2a"
	; Configuration générale
	_doNothingButVersion($next_version)
EndFunc

; Mise à niveau vers 1.3

Func _upgrade_to_1_3()
	Local $next_version = "1.3"
	; Configuration générale
	_doNothingButVersion($next_version)
EndFunc

; Mise à niveau vers 1.3a

Func _upgrade_to_1_3a()
	Local $next_version = "1.3a"
	; Configuration générale
	If compareVersion(_upgrade_readVersion(ORGANIZER_config_file()), $next_version) < 0 Then
		IniWrite(ORGANIZER_config_file(), "", "Version", $next_version)
		FileInstall(".\Organizer\Language\Language.ini", ".\Organizer\Language\Language.ini", 1)
		FileInstall(".\Organizer\Images\Defaut.ico", ".\Organizer\Images\Defaut.ico", 1)
	EndIf
EndFunc

; Mise à niveau vers 1.3b

Func _upgrade_to_1_3b()
	Local $next_version = "1.3b"
	; Configuration générale
	_doNothingButVersion($next_version)
EndFunc

; Mise à niveau vers 1.4

Func _upgrade_to_1_4()
	Local $next_version = "1.4"
	; Configuration générale
	If compareVersion(_upgrade_readVersion(ORGANIZER_config_file()), $next_version) < 0 Then
		IniWrite(ORGANIZER_config_file(), "", "Version", $next_version)
		FileInstall(".\Organizer\Language\Language.ini", ".\Organizer\Language\Language.ini", 1)
		IniWrite(ORGANIZER_config_file(), "Organizer", "Dock",         "W")
		IniWrite(ORGANIZER_config_file(), "Organizer", "Thumbnails",   "N")
		IniWrite(ORGANIZER_config_file(), "Organizer", "CursorCycle",  "N")
		IniWrite(ORGANIZER_config_file(), "Organizer", "PatternTitle", "^(?i)(.*?) - Dofus\s?([a-zA-Z0-9\.\:,]+)$")
	EndIf
EndFunc

; Mise à niveau vers 1.5

Func _upgrade_to_1_5()
	Local $next_version = "1.5"
	; Configuration générale
	If compareVersion(_upgrade_readVersion(ORGANIZER_config_file()), $next_version) < 0 Then
		IniWrite(ORGANIZER_config_file(), "", "Version", $next_version)
		FileInstall(".\Organizer\Language\Language.ini", ".\Organizer\Language\Language.ini", 1)
		; Paramètres par défaut 01 = Dofus en 64 bits sous Windows 10
		IniWrite(ORGANIZER_config_file(), "Params01", "_",            "Dofus")
		IniWrite(ORGANIZER_config_file(), "Params01", "PatternTitle", "^(?i)(.*?) - Dofus\s?(?:[a-zA-Z0-9\.\:,]+)$")
		IniWrite(ORGANIZER_config_file(), "Params01", "PatternDofus", "[CLASS:ApolloRuntimeContentWindow]")
		IniWrite(ORGANIZER_config_file(), "Params01", "RegexpDofus",  "^(?i)dofus[^\.]*\.exe$")
		; Paramètres par défaut 02 = Dofus Retro en 64 bits sous Windows 10
		IniWrite(ORGANIZER_config_file(), "Params02", "_",            "Retro x64")
		IniWrite(ORGANIZER_config_file(), "Params02", "PatternTitle", "^(?i)(.*?) - Dofus\s?(?:[a-zA-Z0-9\.\:,]+)$")
		IniWrite(ORGANIZER_config_file(), "Params02", "PatternDofus", "[CLASS:Chrome_WidgetWin_1]")
		IniWrite(ORGANIZER_config_file(), "Params02", "RegexpDofus",  "^(?i)dofus[^\.]*\.exe$")
		; Paramètres par défaut 03 = Dofus Retro en 32 bits sous Windows 10
		IniWrite(ORGANIZER_config_file(), "Params03", "_",            "Retro x86")
		IniWrite(ORGANIZER_config_file(), "Params03", "PatternTitle", "^(?i)(.*?)$")
		IniWrite(ORGANIZER_config_file(), "Params03", "PatternDofus", "[CLASS:ShockwaveFlash]")
		IniWrite(ORGANIZER_config_file(), "Params03", "RegexpDofus",  "^(?i)dofus[^\.]*\.exe$")
	EndIf
EndFunc

; Mise à niveau vers 1.5a

Func _upgrade_to_1_5a()
	Local $next_version = "1.5a"
	; Configuration générale
	If compareVersion(_upgrade_readVersion(ORGANIZER_config_file()), $next_version) < 0 Then
		IniWrite(ORGANIZER_config_file(), "", "Version", $next_version)
	EndIf
EndFunc

; Mise à niveau vers 1.5b

Func _upgrade_to_1_5b()
	Local $next_version = "1.5b"
	; Configuration générale
	If compareVersion(_upgrade_readVersion(ORGANIZER_config_file()), $next_version) < 0 Then
		IniWrite(ORGANIZER_config_file(), "", "Version", $next_version)
		FileInstall(".\Organizer\Language\Language.ini", ".\Organizer\Language\Language.ini", 1)
	EndIf
EndFunc

; ### Region Fonctions annexes

Func _upgrade_readVersion($file)
	Return IniRead($file, "", "Version", "")
EndFunc
Func _doNothingButVersion($next_version)
	If compareVersion(_upgrade_readVersion(ORGANIZER_config_file()), $next_version) < 0 Then
		IniWrite(ORGANIZER_config_file(), "", "Version", $next_version)
	EndIf
EndFunc

#EndRegion
