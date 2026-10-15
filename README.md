# MOHAB Standalone PT-BR – Installer Source

This repository contains the complete installer and restoration script source for the **Medal of Honor: Above and Beyond Standalone Brazilian Portuguese translation and dubbing mod**.

There is no custom compiled installer, launcher, application, service, DLL, or executable produced by this project. The complete original code consists of two readable Windows batch files:

- `scripts/INSTALL_MOHAB_PICO_OR_META_QUEST.bat`
- `scripts/RESTORE_MOHAB_PICO_OR_META_QUEST.bat`

## Purpose

The mod installs Brazilian Portuguese Wwise audio banks and localization assets on a supported PICO or Meta Quest headset. Installation is performed through Android Debug Bridge after the user enables Developer Mode and authorizes USB debugging.

The installer modifies only:

```text
/sdcard/Android/obb/com.Virtuos.R6DLM/patch.3.12297.com.Virtuos.R6DLM.obb
```

It does not modify `main.obb`.

## Supported game build

```text
Package: com.Virtuos.R6DLM
Version Code: 12297
Version Name: 0.518
```

The installer refuses to continue if the expected game directory or `patch.3` file is missing.

## How the installer works

1. Confirms that `adb.exe` and the mod OBB exist locally.
2. Validates the local OBB size and SHA-256 hash.
3. Starts the ADB server.
4. Requires exactly one authorized Android headset.
5. Reads the headset manufacturer and model.
6. Confirms the expected game directory and original `patch.3` exist.
7. Creates `patch.3.12297.com.Virtuos.R6DLM.obb.backup-original` if no backup exists.
8. Stops the game before transferring data.
9. Uploads the modified OBB under a temporary `.novo` name.
10. Validates the remote size and SHA-256 hash.
11. Renames the verified temporary file to the active `patch.3` name.
12. Tells the user to open the game manually.

## How restoration works

The restoration script requires exactly one authorized headset, verifies that the preserved backup exists, stops the game, copies the backup to a temporary restoration file, and atomically renames it to the active `patch.3` name. The backup remains preserved.

## What the scripts do not do

The scripts do not:

- download any file;
- contact any external server;
- run PowerShell;
- modify the Windows Registry;
- install Windows services or drivers;
- collect or transmit personal information;
- disable security software;
- request administrator privileges;
- execute files received from the headset;
- launch the VR game automatically;
- modify `main.obb`.

## Third-party Android tools

The downloadable mod package includes Google Android SDK Platform-Tools files only to allow installation without requiring the complete Android SDK:

- `adb.exe`
- `AdbWinApi.dll`
- `AdbWinUsbApi.dll`

These files are not built or modified by this project. The distributed ADB reports:

```text
Android Debug Bridge version 1.0.41
Version 34.0.3-10161052
```

Official sources:

- Android SDK Platform-Tools: https://developer.android.com/tools/releases/platform-tools
- Android Debug Bridge documentation: https://developer.android.com/tools/adb
- ADB source code (Google AOSP): https://android.googlesource.com/platform/packages/modules/adb/

See [`docs/THIRD_PARTY_ADB.md`](docs/THIRD_PARTY_ADB.md) for hashes and details.

## Binary mod assets

The distributed OBB is a binary Android expansion container holding Unreal Engine PAK assets. The PAKs contain Brazilian Portuguese Wwise audio banks and localization resources. They are data assets rather than executable application code and are not included in this source repository.

See [`docs/OBB_AND_ASSETS.md`](docs/OBB_AND_ASSETS.md) for its structure and validation information.

## Security and verification

Every distributed file is documented in [`docs/DISTRIBUTED_FILES.md`](docs/DISTRIBUTED_FILES.md). SHA-256 hashes are provided in [`SHA256SUMS.txt`](SHA256SUMS.txt).

The installer validates the OBB before and after transfer:

```text
Expected size: 314427536 bytes
Expected SHA-256: 561B4F19FCD213FF7DB9AA36603122644ADB5B198DDE82169FB098D116381BCB
```

## Hardware status

- PICO 4: physically tested and confirmed.
- Other PICO and Meta Quest models: installer structure is compatible when the exact supported game package/build is present, but individual physical testing is still required.

## Nexus Mods review

This repository is intended to provide Nexus Mods moderators with the complete human-readable installer code and documentation for every distributed component. No custom binary has been omitted because this project does not produce a custom executable.
