
;= PREINSTALL 
;= ################
!macro CustomCodePreInstall

!macroend

;= POSTINSTALL
;= ################
!macro CustomCodePostInstall
	IfFileExists "$INSTDIR\Notepad++Portable.ini" +2
	CopyFiles /SILENT "$INSTDIR\Other\Source\Notepad++Portable.ini" "$INSTDIR"
!macroend