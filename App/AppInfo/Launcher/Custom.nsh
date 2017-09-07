
;= LAUNCHER
;= ################
; This PAF was compiled using a modified version of PAL:
; https://github.com/demondevin/portableapps.comlauncher

;= VARIABLES
;= ################

;= DEFINES
;= ################
!define _      `${PAF}\Keys`
!define CL     SOFTWARE\Classes
!define CLS    HKLM\${CL}
!define ULS    HKCU\${CL}
!define SHL    Software\WinRAR\Setup
!define EX     SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts
!define EXTS   HKCU\Software\Microsoft\Windows\Roaming\OpenWith\FileExts
!define EXT    HKCU\${EX}
!define XML    `${SET}\nativeLang.xml`
!define DEFXML `${DEFSET}\nativeLang.xml`
!define LNG    `${APPDIR}\localization\$0`
!define XPATH  /NotepadPlus/Native-Langue
!define EXE    `${APPDIR}\${APP}.exe`
!define SND    `$SENDTO\${APP}.lnk`
!define PFM    `$0\PortableApps.com\PortableAppsPlatform.exe`

;= MACROS 
;= ################
!define MsgBox "!insertmacro _MsgBox"
!macro _MsgBox
	StrCpy $MissingFileOrPath `Windows XP or newer`
	MessageBox MB_ICONSTOP|MB_TOPMOST `$(LauncherFileNotFound)`
	Call Unload
	Quit
!macroend

;= FUNCTIONS 
;= ################
Function Init::Mirror
	!macro _Init::Mirror _PATH _FILTER
		Push `${_FILTER}`
		Push `${_PATH}`
		Call Init::Mirror
	!macroend
	!define Init::Mirror "!insertmacro _Init::Mirror"
	Exch $R0 ; path
	Exch
	Exch $R1 ; filter or wildcard
	Push $R2
	Push $R3
	FindFirst $R3 $R4 `${DEFDATA}\$R0\$R1`
	StrCmpS $R3 "" +8
	StrCmpS $R4 "" +7
	StrCmpS $R4 "." +4
	StrCmpS $R4 ".." +3
	IfFileExists `${DATA}\$R0\$R4` +2
	CopyFiles /SILENT `${DEFDATA}\$R0\$R4` `${DATA}\$R0\$R4`
	FindNext $R3 $R4
	Goto -6
	FindClose $R3
	Pop $R3
	Pop $R2
	Pop $R1
	Pop $R1
FunctionEnd
Function GetIconIndex
	!macro _GetIconIndex _TYPE
		Push ${_TYPE}
		Call GetIconIndex
		Pop ${_TYPE}
	!macroend
	!define GetIconIndex "!insertmacro _GetIconIndex"
	Exch $0
	StrCmpS $0 log END
	StrCmpS $0 mapimail END
	StrCmpS $0 txt END
	StrCmpS $0 ini END
	StrCmpS $0 inf END
	StrCmpS $0 h END
	StrCmpS $0 hh END
	StrCmpS $0 hpp END
	StrCmpS $0 hxx END
	StrCmpS $0 c END
	StrCmpS $0 cpp END
	StrCmpS $0 cxx END
	StrCmpS $0 cc END
	StrCmpS $0 m END
	StrCmpS $0 mm END
	StrCmpS $0 vcxproj END
	StrCmpS $0 vcproj END
	StrCmpS $0 props END
	StrCmpS $0 vsprops END
	StrCmpS $0 manifest END
	StrCmpS $0 java END
	StrCmpS $0 cs END
	StrCmpS $0 pas END
	StrCmpS $0 pp END
	StrCmpS $0 inc END
	StrCmpS $0 html END
	StrCmpS $0 htm END
	StrCmpS $0 shtml END
	StrCmpS $0 shtm END
	StrCmpS $0 hta END
	StrCmpS $0 asp END
	StrCmpS $0 aspx END
	StrCmpS $0 css END
	StrCmpS $0 js END
	StrCmpS $0 json END
	StrCmpS $0 jsm END
	StrCmpS $0 jsp END
	StrCmpS $0 php END
	StrCmpS $0 php3 END
	StrCmpS $0 php4 END
	StrCmpS $0 phps END
	StrCmpS $0 phpt END
	StrCmpS $0 phtml END
	StrCmpS $0 xml END
	StrCmpS $0 xhtml END
	StrCmpS $0 xht END
	StrCmpS $0 sul END
	StrCmpS $0 kml END
	StrCmpS $0 xaml END
	StrCmpS $0 xsml END
	StrCmpS $0 sh END
	StrCmpS $0 bsh END
	StrCmpS $0 bash END
	StrCmpS $0 bat END
	StrCmpS $0 cmd END
	StrCmpS $0 nsi END
	StrCmpS $0 nsh END
	StrCmpS $0 lua END
	StrCmpS $0 pl END
	StrCmpS $0 pm END
	StrCmpS $0 py END
	StrCmpS $0 rc END
	StrCmpS $0 as END
	StrCmpS $0 mx END
	StrCmpS $0 vb END
	StrCmpS $0 vbs END
	StrCmpS $0 f END
	StrCmpS $0 for END
	StrCmpS $0 f90 END
	StrCmpS $0 f95 END
	StrCmpS $0 f2k END
	StrCmpS $0 tex END
	StrCmpS $0 sql END
	StrCmpS $0 nfo END
	StrCmpS $0 mak END
	StrCpy $0 error
	END:
	Exch $0
FunctionEnd
Function GetLCID
	!macro _GetLCID _LNG _LCID
		Push ${_LNG}
		Call GetLCID
		Pop ${_LCID}
	!macroend
	!define GetLCID "!insertmacro _GetLCID"
	Exch $0
	StrCmpS $0 afrikaans.xml 0 +3
	StrCpy $0 1078
		Goto EndLCID
	StrCmpS $0 albanian.xml 0 +3
	StrCpy $0 1052
		Goto EndLCID
	StrCmpS $0 arabic.xml 0 +3
	StrCpy $0 1025
		Goto EndLCID
	StrCmpS $0 aragonese.xml 0 +3
	StrCpy $0 8888
		Goto EndLCID
	StrCmpS $0 aranese.xml 0 +3
	StrCpy $0 7001
		Goto EndLCID
	StrCmpS $0 azerbaijani.xml 0 +3
	StrCpy $0 1068
		Goto EndLCID
	StrCmpS $0 basque.xml 0 +3
	StrCpy $0 1069
		Goto EndLCID
	StrCmpS $0 belarusian.xml 0 +3
	StrCpy $0 1059
		Goto EndLCID
	StrCmpS $0 bengali.xml 0 +3
	StrCpy $0 2117
		Goto EndLCID
	StrCmpS $0 bosnian.xml 0 +3
	StrCpy $0 5146
		Goto EndLCID
	StrCmpS $0 brazilian_portuguese.xml 0 +3
	StrCpy $0 1046
		Goto EndLCID
	StrCmpS $0 bulgarian.xml 0 +3
	StrCpy $0 1026
		Goto EndLCID
	StrCmpS $0 catalan.xml 0 +3
	StrCpy $0 1027
		Goto EndLCID
	StrCmpS $0 chinese.xml 0 +3
	StrCpy $0 1028
		Goto EndLCID
	StrCmpS $0 chineseSimplified.xml 0 +3
	StrCpy $0 2052
		Goto EndLCID
	StrCmpS $0 croatian.xml 0 +3
	StrCpy $0 1050
		Goto EndLCID
	StrCmpS $0 czech.xml 0 +3
	StrCpy $0 1029
		Goto EndLCID
	StrCmpS $0 danish.xml 0 +3
	StrCpy $0 1030
		Goto EndLCID
	StrCmpS $0 dutch.xml 0 +3
	StrCpy $0 1043
		Goto EndLCID
	StrCmpS $0 english.xml 0 +3
	StrCpy $0 1033
		Goto EndLCID
	StrCmpS $0 english_customizable.xml 0 +3
	StrCpy $0 7002
		Goto EndLCID
	StrCmpS $0 esperanto.xml 0 +3
	StrCpy $0 9998
		Goto EndLCID
	StrCmpS $0 extremaduran.xml 0 +3
	StrCpy $0 8885
		Goto EndLCID
	StrCmpS $0 farsi.xml 0 +3
	StrCpy $0 1065
		Goto EndLCID
	StrCmpS $0 finnish.xml 0 +3
	StrCpy $0 1035
		Goto EndLCID
	StrCmpS $0 french.xml 0 +3
	StrCpy $0 1036
		Goto EndLCID
	StrCmpS $0 friulian.xml 0 +3
	StrCpy $0 8884
		Goto EndLCID
	StrCmpS $0 galician.xml 0 +3
	StrCpy $0 1110
		Goto EndLCID
	StrCmpS $0 georgian.xml 0 +3
	StrCpy $0 1079
		Goto EndLCID
	StrCmpS $0 german.xml 0 +3
	StrCpy $0 1031
		Goto EndLCID
	StrCmpS $0 greek.xml 0 +3
	StrCpy $0 1032
		Goto EndLCID
	StrCmpS $0 gujarati.xml 0 +3
	StrCpy $0 1095
		Goto EndLCID
	StrCmpS $0 hebrew.xml 0 +3
	StrCpy $0 1037
		Goto EndLCID
	StrCmpS $0 hindi.xml 0 +3
	StrCpy $0 1081
		Goto EndLCID
	StrCmpS $0 hungarian.xml 0 +3
	StrCpy $0 1038
		Goto EndLCID
	StrCmpS $0 indonesian.xml 0 +3
	StrCpy $0 1057
		Goto EndLCID
	StrCmpS $0 italian.xml 0 +3
	StrCpy $0 1040
		Goto EndLCID
	StrCmpS $0 japanese.xml 0 +3
	StrCpy $0 1041
		Goto EndLCID
	StrCmpS $0 kabyle.xml 0 +3
	StrCpy $0 2143
		Goto EndLCID
	StrCmpS $0 kannada.xml 0 +3
	StrCpy $0 1099
		Goto EndLCID
	StrCmpS $0 kazakh.xml 0 +3
	StrCpy $0 1087
		Goto EndLCID
	StrCmpS $0 korean.xml 0 +3
	StrCpy $0 1042
		Goto EndLCID
	StrCmpS $0 kyrgyz.xml 0 +3
	StrCpy $0 1088
		Goto EndLCID
	StrCmpS $0 latvian.xml 0 +3
	StrCpy $0 1062
		Goto EndLCID
	StrCmpS $0 ligurian.xml 0 +3
	StrCpy $0 8880
		Goto EndLCID
	StrCmpS $0 lithuanian.xml 0 +3
	StrCpy $0 1063
		Goto EndLCID
	StrCmpS $0 luxembourgish.xml 0 +3
	StrCpy $0 4103
		Goto EndLCID
	StrCmpS $0 macedonian.xml 0 +3
	StrCpy $0 1071
		Goto EndLCID
	StrCmpS $0 malay.xml 0 +3
	StrCpy $0 1086
		Goto EndLCID
	StrCmpS $0 marathi.xml 0 +3
	StrCpy $0 1102
		Goto EndLCID
	StrCmpS $0 mongolian.xml 0 +3
	StrCpy $0 1104
		Goto EndLCID
	StrCmpS $0 norwegian.xml 0 +3
	StrCpy $0 1044
		Goto EndLCID
	StrCmpS $0 nynorsk.xml 0 +3
	StrCpy $0 2068
		Goto EndLCID
	StrCmpS $0 occitan.xml 0 +3
	StrCpy $0 1154
		Goto EndLCID
	StrCmpS $0 polish.xml 0 +3
	StrCpy $0 1045
		Goto EndLCID
	StrCmpS $0 portuguese.xml 0 +3
	StrCpy $0 2070
		Goto EndLCID
	StrCmpS $0 romanian.xml 0 +3
	StrCpy $0 1048
		Goto EndLCID
	StrCmpS $0 russian.xml 0 +3
	StrCpy $0 1049
		Goto EndLCID
	StrCmpS $0 samogitian.xml 0 +3
	StrCpy $0 7000
		Goto EndLCID
	StrCmpS $0 sardinian.xml 0 +3
	StrCpy $0 8881
		Goto EndLCID
	StrCmpS $0 serbian.xml 0 +3
	StrCpy $0 2074
		Goto EndLCID
	StrCmpS $0 serbianCyrillic.xml 0 +3
	StrCpy $0 3098
		Goto EndLCID
	StrCmpS $0 sinhala.xml 0 +3
	StrCpy $0 1115
		Goto EndLCID
	StrCmpS $0 slovak.xml 0 +3
	StrCpy $0 1051
		Goto EndLCID
	StrCmpS $0 slovenian.xml 0 +3
	StrCpy $0 1060
		Goto EndLCID
	StrCmpS $0 spanish.xml 0 +3
	StrCpy $0 1034
		Goto EndLCID
	StrCmpS $0 spanish_ar.xml 0 +3
	StrCpy $0 3082
		Goto EndLCID
	StrCmpS $0 swedish.xml 0 +3
	StrCpy $0 1053
		Goto EndLCID
	StrCmpS $0 tagalog.xml 0 +3
	StrCpy $0 1124
		Goto EndLCID
	StrCmpS $0 tamil.xml 0 +3
	StrCpy $0 1097
		Goto EndLCID
	StrCmpS $0 telugu.xml 0 +3
	StrCpy $0 1098
		Goto EndLCID
	StrCmpS $0 thai.xml 0 +3
	StrCpy $0 1054
		Goto EndLCID
	StrCmpS $0 turkish.xml 0 +3
	StrCpy $0 1055
		Goto EndLCID
	StrCmpS $0 ukrainian.xml 0 +3
	StrCpy $0 1058
		Goto EndLCID
	StrCmpS $0 urdu.xml 0 +3
	StrCpy $0 1056
		Goto EndLCID
	StrCmpS $0 uyghur.xml 0 +3
	StrCpy $0 1152
		Goto EndLCID
	StrCmpS $0 uzbek.xml 0 +3
	StrCpy $0 1091
		Goto EndLCID
	StrCmpS $0 uzbekCyrillic.xml 0 +3
	StrCpy $0 2115
		Goto EndLCID
	StrCmpS $0 vietnamese.xml 0 +3
	StrCpy $0 1066
		Goto EndLCID
	StrCmpS $0 welsh.xml 0 +3
	StrCpy $0 1106
		Goto +2
	StrCpy $0 1033
	EndLCID:
	Exch $0
FunctionEnd
Function GetLNG
	!macro _GetLNG _LCID _LNG
		Push ${_LCID}
		Call GetLNG
		Pop ${_LNG}
	!macroend
	!define GetLNG "!insertmacro _GetLNG"
	Exch $0
	StrCmpS $0 1078 0 +3
	StrCpy $0 afrikaans.xml
		Goto EndLNG
	StrCmpS $0 1052 0 +3
	StrCpy $0 albanian.xml
		Goto EndLNG
	StrCmpS $0 1025 0 +3
	StrCpy $0 arabic.xml
		Goto EndLNG
	StrCmpS $0 8888 0 +3
	StrCpy $0 aragonese.xml
		Goto EndLNG
	StrCmpS $0 7001 0 +3
	StrCpy $0 aranese.xml
		Goto EndLNG
	StrCmpS $0 1068 0 +3
	StrCpy $0 azerbaijani.xml
		Goto EndLNG
	StrCmpS $0 1069 0 +3
	StrCpy $0 basque.xml
		Goto EndLNG
	StrCmpS $0 1059 0 +3
	StrCpy $0 belarusian.xml
		Goto EndLNG
	StrCmpS $0 2117 0 +3
	StrCpy $0 bengali.xml
		Goto EndLNG
	StrCmpS $0 5146 0 +3
	StrCpy $0 bosnian.xml
		Goto EndLNG
	StrCmpS $0 1046 0 +3
	StrCpy $0 brazilian_portuguese.xml
		Goto EndLNG
	StrCmpS $0 1026 0 +3
	StrCpy $0 bulgarian.xml
		Goto EndLNG
	StrCmpS $0 1027 0 +3
	StrCpy $0 catalan.xml
		Goto EndLNG
	StrCmpS $0 1028 0 +3
	StrCpy $0 chinese.xml
		Goto EndLNG
	StrCmpS $0 2052 0 +3
	StrCpy $0 chineseSimplified.xml
		Goto EndLNG
	StrCmpS $0 1050 0 +3
	StrCpy $0 croatian.xml
		Goto EndLNG
	StrCmpS $0 1029 0 +3
	StrCpy $0 czech.xml
		Goto EndLNG
	StrCmpS $0 1030 0 +3
	StrCpy $0 danish.xml
		Goto EndLNG
	StrCmpS $0 1043 0 +3
	StrCpy $0 dutch.xml
		Goto EndLNG
	StrCmpS $0 1033 0 +3
	StrCpy $0 english.xml
		Goto EndLNG
	StrCmpS $0 7002 0 +3
	StrCpy $0 english_customizable.xml
		Goto EndLNG
	StrCmpS $0 9998 0 +3
	StrCpy $0 esperanto.xml
		Goto EndLNG
	StrCmpS $0 8885 0 +3
	StrCpy $0 extremaduran.xml
		Goto EndLNG
	StrCmpS $0 1065 0 +3
	StrCpy $0 farsi.xml
		Goto EndLNG
	StrCmpS $0 1035 0 +3
	StrCpy $0 finnish.xml
		Goto EndLNG
	StrCmpS $0 1036 0 +3
	StrCpy $0 french.xml
		Goto EndLNG
	StrCmpS $0 8884 0 +3
	StrCpy $0 friulian.xml
		Goto EndLNG
	StrCmpS $0 1110 0 +3
	StrCpy $0 galician.xml
		Goto EndLNG
	StrCmpS $0 1079 0 +3
	StrCpy $0 georgian.xml
		Goto EndLNG
	StrCmpS $0 1031 0 +3
	StrCpy $0 german.xml
		Goto EndLNG
	StrCmpS $0 1032 0 +3
	StrCpy $0 greek.xml
		Goto EndLNG
	StrCmpS $0 1095 0 +3
	StrCpy $0 gujarati.xml
		Goto EndLNG
	StrCmpS $0 1037 0 +3
	StrCpy $0 hebrew.xml
		Goto EndLNG
	StrCmpS $0 1081 0 +3
	StrCpy $0 hindi.xml
		Goto EndLNG
	StrCmpS $0 1038 0 +3
	StrCpy $0 hungarian.xml
		Goto EndLNG
	StrCmpS $0 1057 0 +3
	StrCpy $0 indonesian.xml
		Goto EndLNG
	StrCmpS $0 1040 0 +3
	StrCpy $0 italian.xml
		Goto EndLNG
	StrCmpS $0 1041 0 +3
	StrCpy $0 japanese.xml
		Goto EndLNG
	StrCmpS $0 2143 0 +3
	StrCpy $0 kabyle.xml
		Goto EndLNG
	StrCmpS $0 1099 0 +3
	StrCpy $0 kannada.xml
		Goto EndLNG
	StrCmpS $0 1087 0 +3
	StrCpy $0 kazakh.xml
		Goto EndLNG
	StrCmpS $0 1042 0 +3
	StrCpy $0 korean.xml
		Goto EndLNG
	StrCmpS $0 1088 0 +3
	StrCpy $0 kyrgyz.xml
		Goto EndLNG
	StrCmpS $0 1062 0 +3
	StrCpy $0 latvian.xml
		Goto EndLNG
	StrCmpS $0 8880 0 +3
	StrCpy $0 ligurian.xml
		Goto EndLNG
	StrCmpS $0 1063 0 +3
	StrCpy $0 lithuanian.xml
		Goto EndLNG
	StrCmpS $0 4103 0 +3
	StrCpy $0 luxembourgish.xml
		Goto EndLNG
	StrCmpS $0 1071 0 +3
	StrCpy $0 macedonian.xml
		Goto EndLNG
	StrCmpS $0 1086 0 +3
	StrCpy $0 malay.xml
		Goto EndLNG
	StrCmpS $0 1102 0 +3
	StrCpy $0 marathi.xml
		Goto EndLNG
	StrCmpS $0 1104 0 +3
	StrCpy $0 mongolian.xml
		Goto EndLNG
	StrCmpS $0 1044 0 +3
	StrCpy $0 norwegian.xml
		Goto EndLNG
	StrCmpS $0 2068 0 +3
	StrCpy $0 nynorsk.xml
		Goto EndLNG
	StrCmpS $0 1154 0 +3
	StrCpy $0 occitan.xml
		Goto EndLNG
	StrCmpS $0 1045 0 +3
	StrCpy $0 polish.xml
		Goto EndLNG
	StrCmpS $0 2070 0 +3
	StrCpy $0 portuguese.xml
		Goto EndLNG
	StrCmpS $0 1048 0 +3
	StrCpy $0 romanian.xml
		Goto EndLNG
	StrCmpS $0 1049 0 +3
	StrCpy $0 russian.xml
		Goto EndLNG
	StrCmpS $0 7000 0 +3
	StrCpy $0 samogitian.xml
		Goto EndLNG
	StrCmpS $0 8881 0 +3
	StrCpy $0 sardinian.xml
		Goto EndLNG
	StrCmpS $0 2074 0 +3
	StrCpy $0 serbian.xml
		Goto EndLNG
	StrCmpS $0 3098 0 +3
	StrCpy $0 serbianCyrillic.xml
		Goto EndLNG
	StrCmpS $0 1115 0 +3
	StrCpy $0 sinhala.xml
		Goto EndLNG
	StrCmpS $0 1051 0 +3
	StrCpy $0 slovak.xml
		Goto EndLNG
	StrCmpS $0 1060 0 +3
	StrCpy $0 slovenian.xml
		Goto EndLNG
	StrCmpS $0 1034 0 +3
	StrCpy $0 spanish.xml
		Goto EndLNG
	StrCmpS $0 3082 0 +3
	StrCpy $0 spanish_ar.xml
		Goto EndLNG
	StrCmpS $0 1053 0 +3
	StrCpy $0 swedish.xml
		Goto EndLNG
	StrCmpS $0 1124 0 +3
	StrCpy $0 tagalog.xml
		Goto EndLNG
	StrCmpS $0 1097 0 +3
	StrCpy $0 tamil.xml
		Goto EndLNG
	StrCmpS $0 1098 0 +3
	StrCpy $0 telugu.xml
		Goto EndLNG
	StrCmpS $0 1054 0 +3
	StrCpy $0 thai.xml
		Goto EndLNG
	StrCmpS $0 1055 0 +3
	StrCpy $0 turkish.xml
		Goto EndLNG
	StrCmpS $0 1058 0 +3
	StrCpy $0 ukrainian.xml
		Goto EndLNG
	StrCmpS $0 1056 0 +3
	StrCpy $0 urdu.xml
		Goto EndLNG
	StrCmpS $0 1152 0 +3
	StrCpy $0 uyghur.xml
		Goto EndLNG
	StrCmpS $0 1091 0 +3
	StrCpy $0 uzbek.xml
		Goto EndLNG
	StrCmpS $0 2115 0 +3
	StrCpy $0 uzbekCyrillic.xml
		Goto EndLNG
	StrCmpS $0 1066 0 +3
	StrCpy $0 vietnamese.xml
		Goto EndLNG
	StrCmpS $0 1106 0 +3
	StrCpy $0 welsh.xml
		Goto +2
	StrCpy $0 error
	EndLNG:
	Exch $0
FunctionEnd
Function PAL:LanguageLCID
	nsisXML::create
	IfFileExists `${XML}` 0 +3
	nsisXML::load `${XML}`
	Goto +2
	nsisXML::load `${DEFXML}`
	nsisXML::select ${XPATH}
	StrCmpS $2 0 0 +3
	SetErrors
	Goto +9
	nsisXML::getAttribute filename
	Push $3
	nsisXML::release $1
	IfFileExists `${XML}` 0 +3
	nsisXML::save `${XML}`
	Goto +2
	nsisXML::save `${DEFXML}`
	nsisXML::release $0
	Call GetLCID
	Pop $0
	System::Call 'Kernel32::SetEnvironmentVariable(t "PAL:LanguageLCID", t "$0")'
FunctionEnd

;= CUSTOM 
;= ################
${SegmentFile}
!macro OS
	${If} ${IsNT}
		${IfNot} ${AtLeastWinXP}
			${MsgBox}
		${EndIf}
	${Else}
		${MsgBox}
	${EndIf}
!macroend
!macro Lang
	Push '$EXEDIR'
	Call Get.Parent
	Pop $0
	IfFileExists '${PFM}' 0 +6
	ReadEnvStr $0 PAL:LanguageLCID
	Push $0
	Call GetLNG
	Pop $0
	StrCmpS $0 error 0 +2
	Call PAL:LanguageLCID
!macroend
!macro LangInit
	ReadEnvStr $0 PAL:LanguageLCID
	Push $0
	Call GetLNG
	Pop $0
	System::Call 'Kernel32::SetEnvironmentVariable(t "PAL:LanguageCustom", t "$0")'
	CopyFiles /SILENT `${LNG}` `${XML}`
!macroend
!macro Init
	Push `${CONFIG}`
	Push Banner=
	Call ReadS
	Pop $0
	StrCmpS $0 true 0 +6
	Banner::show ""
	Banner::getWindow
	Pop $0
	GetDlgItem $0 $0 1030
	SendMessage $0 ${WM_SETTEXT} 0 "STR:$(i)"
	${Init::File} Fonts .Portable.Fonts.txt
	${Init::Mirror} settings *.xml
!macroend
${SegmentPrePrimary}
	${File::BackupLocal} `${SND}`
!macroend
!macro PreExecExecute
	Push `${CONFIG}`
	Push Banner=
	Call ReadS
	Pop $0
	StrCmpS $0 true 0 +3
	StrCmpS $SecondaryLaunch true +2
	Banner::destroy
!macroend
${SegmentPostPrimary}
	${File::RestoreLocal} `${SND}`
!macroend
!macro PreReg
	StrCpy $0 1
		ClearErrors
		ReadINIStr $1 `${LAUNCHER}` Associations $0
		IfErrors +49
		Push $1
		Call GetIconIndex
		Pop $1
		StrCmpS $1 error +43
		StrCpy $2 1
		IfFileExists `${RUNTIME}` 0 +3
		ReadINIStr $3 `${RUNTIME}` Associations $2
		Goto +2
		ReadINIStr $3 `${RUNTIME2}` Associations $2
		StrCmpS $3 "" +3
		IntOp $2 $2 + 1
		Goto -6
		WriteINIStr `${RUNTIME}` Associations $2 $1
		WriteINIStr `${RUNTIME2}` Associations $2 $1
		Registry::_KeyExists /NOUNLOAD `${_}\${ULS}\.$1`
		Pop $2
		StrCmpS $2 -1 0 +6
		Registry::_KeyExists /NOUNLOAD `${ULS}\.$1`
		Pop $2
		StrCmpS $2 0 0 +3
			Registry::_MoveKey /NOUNLOAD `${ULS}\.$1` `${_}\${ULS}\.$1`
			Pop $2
		Registry::_KeyExists /NOUNLOAD `${_}\${ULS}\${APP}.$1`
		Pop $2
		StrCmpS $2 -1 0 +6
		Registry::_KeyExists /NOUNLOAD `${ULS}\${APP}.$1`
		Pop $2
		StrCmpS $2 0 0 +3
			Registry::_MoveKey /NOUNLOAD `${ULS}\${APP}.$1` `${_}\${ULS}\${APP}.$1`
			Pop $2
		Registry::_KeyExists /NOUNLOAD `${_}\${EXT}\.$1`
		Pop $2
		StrCmpS $2 -1 0 +6
		Registry::_KeyExists /NOUNLOAD `${EXT}\.$1`
		Pop $2
		StrCmpS $2 0 0 +3
			Registry::_MoveKey /NOUNLOAD `${EXT}\.$1` `${_}\${EXT}\.$1`
			Pop $2
		Registry::_KeyExists /NOUNLOAD `${_}\${EXTS}\.$1`
		Pop $2
		StrCmpS $2 -1 0 +6
		Registry::_KeyExists /NOUNLOAD `${EXTS}\.$1`
		Pop $2
		StrCmpS $2 0 0 +3
			Registry::_MoveKey /NOUNLOAD `${EXTS}\.$1` `${_}\${EXTS}\.$1`
			Pop $2
		IntOp $0 $0 + 1
	Goto -50
!macroend
!macro UnPreRegWrite
	StrCpy $0 1
		IfFileExists `${RUNTIME}` 0 +4
		ClearErrors
		ReadINIStr $1 `${RUNTIME}` Associations $0
		Goto +3
		ClearErrors
		ReadINIStr $1 `${RUNTIME2}` Associations $0
		IfErrors +11
			Push $1
			Call GetIconIndex
			Pop $1
		WriteRegStr HKCU `${CL}\.$1` "" ${APP}.$1
		WriteRegStr HKCU `${CL}\${APP}.$1\DefaultIcon` "" `${EXE}`
		WriteRegStr HKCU `${CL}\${APP}.$1\shell\open` "" `${APP}`
		WriteRegStr HKCU `${CL}\${APP}.$1\shell\open` Icon `${EXE}`
		WriteRegStr HKCU `${CL}\${APP}.$1\shell\open\command` "" `"${EXE}" "%1"`
		IntOp $0 $0 + 1
	Goto -16
!macroend
!macro PostReg
	StrCpy $0 1
		IfFileExists `${RUNTIME}` 0 +4
		ClearErrors
		ReadINIStr $1 `${RUNTIME}` Associations $0
		Goto +3
		ClearErrors
		ReadINIStr $1 `${RUNTIME2}` Associations $0
		IfErrors +59
		Registry::_DeleteKey /NOUNLOAD `${ULS}\.$1`
		Pop $2
		Registry::_KeyExists /NOUNLOAD `${_}\${ULS}\.$1`
		Pop $2
		StrCmpS $2 0 0 +10
			Registry::_MoveKey /NOUNLOAD `${_}\${ULS}\.$1` `${ULS}\.$1`
			Pop $2
				StrCpy $3 `${ULS}\.$1`
				Push `$3`
				Call Get.Parent
				Pop $3
				Registry::_DeleteKeyEmpty /NOUNLOAD `${_}\$3`
				Pop $2
			StrCmpS $3 "" 0 -5
		Registry::_DeleteKey /NOUNLOAD `${ULS}\${APP}.$1`
		Pop $2
		Registry::_KeyExists /NOUNLOAD `${_}\${ULS}\${APP}.$1`
		Pop $2
		StrCmpS $2 0 0 +10
			Registry::_MoveKey /NOUNLOAD `${_}\${ULS}\${APP}.$1` `${ULS}\${APP}.$1`
			Pop $2
				StrCpy $3 `${ULS}\${APP}.$1`
				Push `$3`
				Call Get.Parent
				Pop $3
				Registry::_DeleteKeyEmpty /NOUNLOAD `${_}\$3`
				Pop $2
			StrCmpS $3 "" 0 -5
		Registry::_DeleteKey /NOUNLOAD `${EXT}\.$1`
		Pop $2
		Registry::_KeyExists /NOUNLOAD `${_}\${EXT}\.$1`
		Pop $2
		StrCmpS $2 0 0 +10
			Registry::_MoveKey /NOUNLOAD `${_}\${EXT}\.$1` `${EXT}\.$1`
			Pop $2
			StrCpy $3 `${EXT}\.$1`
				Push `$3`
				Call Get.Parent
				Pop $3
				Registry::_DeleteKeyEmpty /NOUNLOAD `${_}\$3`
				Pop $2
			StrCmpS $3 "" 0 -5
		Registry::_DeleteKey /NOUNLOAD `${EXTS}\.$1`
		Pop $2
		Registry::_KeyExists /NOUNLOAD `${_}\${EXTS}\.$1`
		Pop $2
		StrCmpS $2 0 0 +10
			Registry::_MoveKey /NOUNLOAD `${_}\${EXTS}\.$1` `${EXTS}\.$1`
			Pop $2
			StrCpy $3 `${EXTS}\.$1`
				Push `$3`
				Call Get.Parent
				Pop $3
				Registry::_DeleteKeyEmpty /NOUNLOAD `${_}\$3`
				Pop $2
			StrCmpS $3 "" 0 -5
		IntOp $0 $0 + 1
	Goto -64
	Registry::_DeleteKeyEmpty /NOUNLOAD ${_}
	Pop $2
	Registry::_DeleteKeyEmpty /NOUNLOAD ${PAF}
	Pop $2
!macroend
${SegmentUnload}
	FindFirst $0 $1 `$LOCALAPPDATA\Microsoft\*`
	StrCmpS $0 "" +12
	StrCmpS $1 "" +11
	StrCmpS $1 "." +8
	StrCmpS $1 ".." +7
	StrCpy $2 $1 3
	StrCmpS $2 CLR 0 +5
	IfFileExists `$LOCALAPPDATA\Microsoft\$1\UsageLogs\${APP}.exe.log` 0 +2
	Delete `$LOCALAPPDATA\Microsoft\$1\UsageLogs\*.log`
	RMDir `$LOCALAPPDATA\Microsoft\$1\UsageLogs`
	RMDir `$LOCALAPPDATA\Microsoft\$1`
	FindNext $0 $1
	Goto -10
	FindClose $0
!macroend
