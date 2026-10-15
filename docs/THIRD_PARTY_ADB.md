# Third-party ADB files

The mod uses Android Debug Bridge to copy the prepared OBB to an Android-based PICO or Meta Quest headset authorized by the user.

ADB is not developed, compiled, or modified by this project. It is part of Google's Android SDK Platform-Tools.

## Distributed version

```text
Android Debug Bridge version 1.0.41
Version 34.0.3-10161052
```

## Official references

- Platform-Tools downloads and release notes: https://developer.android.com/tools/releases/platform-tools
- ADB documentation: https://developer.android.com/tools/adb
- ADB source code: https://android.googlesource.com/platform/packages/modules/adb/

## Distributed binary hashes

```text
adb.exe
1DD18B061A5926107812D71905D957E8865B08F6E7D71D3A4D041CACC29D33E6

AdbWinApi.dll
D60103A5E99BC9888F786EE916F5D6E45493C3247972CB053833803DE7E95CF9

AdbWinUsbApi.dll
25207C506D29C4E8DCEB61B4BD50E8669BA26012988A43FBF26A890B1E60FC97
```

The DLL file metadata identifies them as Google Android ADB API components. Windows Authenticode reports these three distributed files as unsigned; this fact is documented rather than concealed.

Users may replace the bundled `ferramentas` directory with the corresponding files downloaded directly from Google's Android SDK Platform-Tools, provided the BAT paths remain unchanged.
