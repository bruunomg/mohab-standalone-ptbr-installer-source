# OBB and mod assets

`patch.3.12297.com.Virtuos.R6DLM.obb` is an Android expansion container. It is not an executable program and has no application source code or custom compiler.

## Validated file

```text
Size: 314427536 bytes
SHA-256: 561B4F19FCD213FF7DB9AA36603122644ADB5B198DDE82169FB098D116381BCB
```

## Internal structure

```text
Mohab/Content/Paks/
  pakchunk0_optional_4-Android_ASTC_P.pak
  pakchunk0_optional_5-Android_ASTC_P.pak
  pakchunk0_optional_6-Android_ASTC_P.pak
  pakchunk0_optional_7-Android_ASTC_P.pak
  pakchunk0_optional_9-Android_ASTC.pak
  pakchunk99-Locres-PTBR_P.pak
```

The `_P.pak` files are Unreal Engine override asset containers. They contain Wwise Android audio banks and the Brazilian Portuguese localization file. They contain no Windows executable code.

## Audio validation

- 79 Android Wwise banks rebuilt.
- 4,422 media items processed.
- Codec, channel count, sample rate, and Wwise Vorbis codebook signature checked against the original Android media.
- Audio encoded using Wwise 2019.1.11 for runtime compatibility.

## Why the OBB is not in this repository

This repository exists to disclose the complete installer code and document the binary mod assets. The large OBB contains transformed game data and is distributed through the Nexus Mods file page. It is intentionally not duplicated in this source repository.
