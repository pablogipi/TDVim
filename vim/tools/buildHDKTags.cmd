::
:: Windowsbatch script to build a tags file for the HDK
::

:: Needs to have a proper Houdini environmentsetup with HFS variable set to
:: Houdini install location

@echo off

if not defined HFS (
        echo Houdini environment not correctly set, can't find HFS variable
        exit /b
        )
if not defined HT (
        echo Houdini environment not correctly set, can't find HT variable
        exit /b
        )
if not exist %HFS% (
        echo Can't find Houdini install location: %HFS%
        exit /b
        )
if not exist %HT% (
        echo Can't find Houdini Toolkit install location: %HT%
        exit /b
        )

set CURDIR=%CD%

cd %HT%/include

echo.
echo Building ctags from %HT%/include

ctags -R  --tag-relative=never --sort=yes --c++-kinds=+pf --fields=+imaSft --extras=+q --languages=C++,C --fields-c++=+{properties} -o %CURDIR%/hdk.tags ^
    AU ^
    BM ^
    BV ^
    CE ^
    CH ^
    CHOP ^
    CL ^
    CMD ^
    COP2 ^
    CVEX ^
    dae ^
    DAE ^
    DD ^
    DEP ^
    DM ^
    DOP ^
    DTUI ^
    EXPR ^
    FS ^
    GA ^
    GABC ^
    GAS ^
    GD ^
    GDT ^
    GEO ^
    GOP ^
    GP ^
    GQ ^
    GR ^
    GT ^
    GU ^
    GUI ^
    HAPI ^
    HOM ^
    IMG ^
    IMG3D ^
    KIN ^
    MGR ^
    MOT ^
    MSS ^
    OBJ ^
    OP ^
    OP3D ^
    openvdb ^
    PI ^
    POP ^
    POPNET ^
    PRM ^
    PXL ^
    PY ^
    RBD ^
    RE ^
    ROP ^
    RU ^
    SHOP ^
    SI ^
    SIM ^
    SIMZ ^
    SOP ^
    SYS ^
    TAKE ^
    TIL ^
    TS ^
    UI ^
    UT ^
    VEX ^
    VGEO ^
    VM ^
    VOP ^
    VOPNET ^
    VRAY ^
    \

cd %CURDIR%
echo Ctags saved on %CURDIR%/hdk.tags
