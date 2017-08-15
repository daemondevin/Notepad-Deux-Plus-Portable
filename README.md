# Notepad++ Portable

Notepad++Portable is a portable version of the popular [Notepad++][C1] application. Notepad++ is a free (as in "free speech" and also as in "free beer") source code editor and Notepad replacement that supports several languages.

Based on the powerful editing component Scintilla, Notepad++ is written in C++ and uses pure Win32 API and STL which ensures a higher execution speed and smaller program size. By optimizing as many routines as possible without losing user friendliness, Notepad++ is trying to reduce the world carbon dioxide emissions. When using less CPU power, the PC can throttle down and reduce power consumption, resulting in a greener environment.

Visit the [Notepad++ GitHub project page](https://github.com/notepad-plus-plus/notepad-plus-plus).

## Support

To recompile this PAF you must use my version of the [PortableApps.com Launcher][S1].

 [S1]: https://github.com/demondevin/portableapps.comlauncher

## Download

All downloads available in the [Releases section][D1]. This portable application was packaged using a modified version of the [PortableApps.com][D2] Launcher.

 [D1]: https://github.com/demondevin/Notepad-Portable/releases/latest
 [D2]: http//portableapps.com/

## Features

* Runs the full Notepad++ text and source editor.
* Completely portable - runs off a USB, cloud drive (DropBox, iCloud drive,
  OneDrive, etc) or hard drive.
* No need for any external software - simply download extract and run!
* Packaged in PortableApps.com format for easy integration.
* Associations are supported and easily customizable.
> To add your own file associations, open the `Notepad++Portable.ini` file. Under `[Associations]` add any extension you wish to support. For example:
> ```INI
> [Associations]
> 1=txt
> 2=nsi
> 3=nsh
> 4=nfo
> ```
> For a list of supported filetypes, open `AppInfo.ini` and review the `[Associations]Filetypes` key. 
> 
> **Note**:
> - Adding a lot of extensions can and will effect launch time. 
> - Windows XP tends to cache icon resources which are inevitably visible even after exiting Notepad++.
> - Windows 8 can be problematic and may require unlocking for some filetypes&mdash;_i.e._ when double-clicking on a supported file format and Windows asks you to select Notepad++ from a list. This is because Windows 8 has an implementation of a hash ID for associations. 
> - Do not associate through Notepad++! This will leave trash in the registry when you exit the program. 
* SendTo is also available for any filetypes that aren't associated but are supported for use with Notepad++.
* Optional Fonts folder to support fonts within the directory `..\Data\Fonts`. Any fonts added in this folder will be added to the system and are available for usage during runtime. Be aware, the more fonts to process the longer it will take for the launcher to load and unload these fonts.
> Supported Fonts: 
> - .fon
> - .fnt
> - .ttf
> - .ttc
> - .fot
> - .otf
> - .mmm
> - .pfb
> - .pfm
* More features soon to come!

## System Requirements

* Microsoft Windows XP or later.
* [PortableApps.com Platform][R1] (Optional)

 [R1]: http://portableapps.com/download

## Credits

* FukenGruven was the original developer of this portable release.
* I have added support to compile with my [launcher][S1] and maintain it.
* Notepad++ Portable is a redistribution of the
  [Notepad++][C1] editor developed by [Don HO][C2].
* [PortableApps.com Suite][R1] by [PortableApps.com][D2].
* [PortableApps.com Launcher][S1] developed by [demon.devin][C3].

 [C1]: http://notepad-plus-plus.org/
 [C2]: https://notepad-plus-plus.org/contributors/author.html
 [C3]: https://github.com/demondevin

## License

* Portable application code released under [the MIT license][L1].
* Notepad++ is governed under the [GPL][L2] License.

 [L1]: https://raw.githubusercontent.com/demondevin/Notepad-Portable/master/LICENSE
 [L2]: http://www.gnu.org/copyleft/gpl.html
 
