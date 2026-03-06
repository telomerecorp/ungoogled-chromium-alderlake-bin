# Ungoogled Chromium - Alder Lake Optimized Build

Pre-built [ungoogled-chromium](https://github.com/ungoogled-software/ungoogled-chromium) for Intel 12th Gen (Alder Lake) on CachyOS/Arch Linux.

Built from source every release — no trust required, just convenience.

## Build Environment

| Component | Details |
|-----------|---------|
| CPU | Intel i9-12900H (Alder Lake, 20 threads) |
| GPU | NVIDIA RTX 4060 Max-Q (AD107M) |
| OS | CachyOS (x86_64-v3) |
| Kernel | linux-cachyos-bore |
| Compiler | Clang/LLVM |
| march | alderlake |
| ISA | AVX2, AVX-512 |

## Requirements

- Intel 12th Gen (Alder Lake) or newer **minimum**
- x86_64-v3 compatible CPU (AVX2 required)
- Arch Linux / CachyOS / Manjaro or any pacman-based distro

> AMD Ryzen 6000+ series (Zen 3+) with AVX2 may also work but is untested.

## Install

### Via paru/yay (AUR)
```bash
paru -S ungoogled-chromium-alderlake-bin
```

### Manual
```bash
# Download the latest release
wget https://github.com/3monthsfree/ungoogled-chromium-alderlake-bin/releases/download/VERSION/ungoogled-chromium-alderlake-bin-VERSION-x86_64.pkg.tar.zst

# Install
sudo pacman -U ungoogled-chromium-alderlake-bin-VERSION-x86_64.pkg.tar.zst
```

## Verify

Each release includes a `sha256sums.txt`. Verify before installing:
```bash
sha256sum -c sha256sums.txt
```

## Conflicts

Conflicts with `chromium` and `ungoogled-chromium` — only one Chromium variant can be installed at a time.

## Why build from source?

Pre-built binaries require trusting whoever compiled them. This build is compiled directly from:
- [ungoogled-software/ungoogled-chromium](https://github.com/ungoogled-software/ungoogled-chromium)
- [ungoogled-software/ungoogled-chromium-archlinux](https://github.com/ungoogled-software/ungoogled-chromium-archlinux)

Source checksums are verified during build. The compiled binary is then published here as a convenience for users on identical or compatible hardware who don't want to spend 2+ hours compiling.

## Release Schedule

Follows upstream Chromium releases. Typically updated within a few days of each stable release.

## Node Version Note

When building from source yourself, ensure you use Node 22 (not 24+). The Chromium build scripts perform a version check:
```bash
# If you hit node version errors during build:
sudo pacman -S nodejs-lts-jod  # Node 22 LTS
```

## License

Chromium is licensed under BSD. ungoogled-chromium patches are licensed under BSD. See upstream repositories for full license details.
