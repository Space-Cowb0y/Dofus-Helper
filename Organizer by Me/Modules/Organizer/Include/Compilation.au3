#Include-Once

; ### Region Extraction des fichiers

Func compilation_extract_files()
	; Initialisation
	Local $WorkingDir = @WorkingDir
	FileChangeDir(@ScriptDir)
	; Sous-dossier
	If DirCreateOrExists(".\Organizer\") Then
		; Language
		If DirCreateOrExists(".\Organizer\Language\") Then
			FileInstall(".\Organizer\Language\Language.ini", ".\Organizer\Language\Language.ini")
		EndIf
		; Images
		If DirCreateOrExists(".\Organizer\Images\") Then
			FileInstall(".\Organizer\Images\Activer.ico",     ".\Organizer\Images\Activer.ico")
			FileInstall(".\Organizer\Images\Actualiser.ico",  ".\Organizer\Images\Actualiser.ico")
			FileInstall(".\Organizer\Images\Clavier.ico",     ".\Organizer\Images\Clavier.ico")
			FileInstall(".\Organizer\Images\Configurer.ico",  ".\Organizer\Images\Configurer.ico")
			FileInstall(".\Organizer\Images\Defaut.ico",      ".\Organizer\Images\Defaut.ico")
			FileInstall(".\Organizer\Images\Enregistrer.ico", ".\Organizer\Images\Enregistrer.ico")
			FileInstall(".\Organizer\Images\Droite.ico",      ".\Organizer\Images\Droite.ico")
			FileInstall(".\Organizer\Images\Gauche.ico",      ".\Organizer\Images\Gauche.ico")
			FileInstall(".\Organizer\Images\Quitter.ico",     ".\Organizer\Images\Quitter.ico")
			FileInstall(".\Organizer\Images\Sortir.ico",      ".\Organizer\Images\Sortir.ico")
			; Icones par défaut
			If DirCreateOrExists(".\Organizer\Images\Defaut\") Then
				FileInstall(".\Organizer\Images\Defaut\Dofus.ico", ".\Organizer\Images\Defaut\Dofus.ico")
				FileInstall(".\Organizer\Images\Defaut\Retro.ico", ".\Organizer\Images\Defaut\Retro.ico")
			EndIf
		EndIf
	EndIf
	; Finalisation
	FileChangeDir($WorkingDir)
EndFunc

; ### Region Fonctions Annexes

Func DirCreateOrExists($path)
	If DirCreate($path) Then Return True
	Return FileExists($path)
EndFunc
