# Distributed Files

The Nexus Mods package contains exactly the following seven files.

## Installer source

### `INSTALAR_MOD_MOHAB_PICO_OU_META_QUEST.bat`

Plain-text Windows batch script. Its complete source is available as `scripts/INSTALL_MOHAB_PICO_OR_META_QUEST.bat` in this repository.

### `REVERTER_MOD_MOHAB_PICO_OU_META_QUEST.bat`

Plain-text Windows batch script. Its complete source is available as `scripts/RESTORE_MOHAB_PICO_OR_META_QUEST.bat` in this repository.

### `LEIA-ME.txt`

Portuguese installation and restoration instructions. It contains no executable content.

## Official third-party tools

### `ferramentas/adb.exe`

Google Android Debug Bridge from Android SDK Platform-Tools 34.0.3. It communicates with the authorized Android VR headset.

### `ferramentas/AdbWinApi.dll`

Google Android ADB API library required by ADB on Windows.

### `ferramentas/AdbWinUsbApi.dll`

Google Android ADB WinUSB API library required for USB communication on Windows.

## Mod asset container

### `OBB_MODIFICADA/patch.3.12297.com.Virtuos.R6DLM.obb`

Android expansion container containing the Unreal Engine PAK override assets for the PT-BR audio and localization mod. It is not an executable program.

No other executables, scripts, archives, downloaders, installers, drivers, or hidden files are included.
