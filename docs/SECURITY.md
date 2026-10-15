# Security notes

## Local Windows operations

The installer uses only standard batch commands, `certutil` for local SHA-256 calculation, temporary text files under `%TEMP%`, and Google ADB.

It does not request elevation, modify the registry, install a service, disable security features, or download content.

## Headset operations

All headset operations are visible in the BAT source and limited to the following ADB actions:

- list authorized devices;
- read manufacturer/model properties;
- test for the expected game directory and files;
- stop the game process before replacement;
- create a backup with `cp`;
- upload one OBB using `adb push`;
- read file size with `stat`;
- calculate SHA-256 with `sha256sum`;
- rename verified temporary files with `mv`;
- delete only an invalid temporary `.novo` transfer with `rm -f`.

The scripts do not use root access and do not alter the headset operating system.

## Failure safety

- Installation stops unless exactly one authorized headset is connected.
- Installation stops if the expected game directory or original patch is missing.
- The local OBB must match the embedded size and SHA-256.
- The uploaded temporary OBB must match the same size and SHA-256.
- The active file is replaced only after successful remote verification.
- The original backup is preserved by both installation and restoration.
