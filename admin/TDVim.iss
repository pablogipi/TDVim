; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "TDVim"
#ifndef MyAppVersion
#define MyAppVersion "0.2"
#endif
#define MyAppPublisher "Pablo Gimenez"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{9DE2DE7C-9059-4707-A831-789DA52BB4D9}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppComments=TDVim. VIM setup for TDs
; AppPublisherURL={#MyAppURL}
; AppSupportURL={#MyAppURL}
; AppUpdatesURL={#MyAppURL}
;DefaultDirName={pf}\TDVim
;DefaultDirName={sd}\TDVim
DefaultDirName={%USERPROFILE}\TDVim
;DefaultDirName={userappdata}\TDVim
DefaultGroupName=TDVim
AllowNoIcons=yes
OutputDir=C:\dev\vim\releases
OutputBaseFilename=setup{#MyAppName}_{#MyAppVersion}
SetupIconFile=C:\dev\vim\admin\images\TDVim_logo.ico
WizardSmallImageFile=C:\dev\vim\admin\images\TDVim_logo.bmp
Compression=lzma2/ultra64
SolidCompression=yes
PrivilegesRequired=lowest
ChangesEnvironment =yes
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany=Pablo Gimenez
VersionInfoDescription=VIM setup for Technical Directors
VersionInfoProductName=TDVim
VersionInfoProductVersion={#MyAppVersion}DisableWelcomePage=no


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\dev\vim\vimrc"; DestDir: "{app}"
Source: "C:\dev\vim\admin\SetupUserVimrc.bat"; DestDir: "{app}\admin"
Source: "C:\dev\vim\after\*"; DestDir: "{app}\after"; Flags: recursesubdirs createallsubdirs
Source: "C:\dev\vim\autoload\*"; DestDir: "{app}\autoload"; Flags: recursesubdirs createallsubdirs
Source: "C:\dev\vim\doc\*"; DestDir: "{app}\doc"; Flags: recursesubdirs createallsubdirs
Source: "C:\dev\vim\templates\*"; DestDir: "{app}\templates"; Flags: recursesubdirs createallsubdirs
Source: "C:\dev\vim\UltiSnips\*"; DestDir: "{app}\UltiSnips"; Flags: recursesubdirs createallsubdirs
Source: "C:\dev\vim\fonts\*"; DestDir: "{app}\fonts"; Flags: recursesubdirs createallsubdirs
Source: "C:\dev\vim\plugin\*"; DestDir: "{app}\plugin"; Flags: recursesubdirs createallsubdirs
Source: "C:\Users\pablo\vimfiles\plugged\*"; DestDir: "{%USERPROFILE}\vimfiles\plugged"; Flags: recursesubdirs createallsubdirs; Tasks: plugins
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

; TODO
; - Reinstall without uninstall -> DONE
; - Look what to do with _vimrc  -> DONE
; - Setup environment -> DONE
; - Copy template vimrc, save current vimrc in myvimrc, ask user  -> DONE
; - Version passed by command line -> DONE
; - Script (bat) to make release from command line. makeRelease [version] -> DONE
; - Version needs to appear in install window -> DONE
; - Add two components Main and Plugins. The former installs all pluings -> DONE
; - Release script needs to remove all *~ and *.swo and *.swp before packing release -> DONE
; - SetupUserVimrc.bat needs to check if %USERPROFILE%\vimfiles exists, or create it -> DONE
; - Check that installed plugins are a proper git repo -> DONE
; - If at start time there is no plugged location then ask to run :PlugInstall

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
Root: "HKCU"; Subkey: "Environment"; ValueType: string; ValueName: "TDVIMROOT"; ValueData: "{app}"; Flags: preservestringtype uninsdeletekey

[Run]
Filename: "{app}\admin\SetupUserVimrc.bat"; Flags: postinstall runasoriginaluser; Description: "Setup user vimrc to start TDVim correctly"; StatusMsg: "Configuring TDVim's vimrc"

[Messages]
SetupWindowTitle=%1 Installation

[Tasks]
Name: "plugins"; Description: "Plug-Ins used by TDVim"; Flags: unchecked checkedonce

[Dirs]
Name: "{app}\plugin\fzf\"
