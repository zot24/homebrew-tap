# homebrew-tap

Homebrew tap for zot24's tools.

```bash
brew tap zot24/tap
```

## Install

| Name | Command | What it is |
| --- | --- | --- |
| mercator | `brew install mercator` | Cartography for your local development landscape |
| simon | `brew install simon` | System monitor that groups processes into apps |
| cadence | `brew install --cask cadence` | Menu-bar control plane for scheduled jobs |
| dewey | `brew install --cask dewey` | Native macOS control panel for an llm-wiki hub |
| moshi-desktop | `brew install --cask moshi-desktop` | Native desktop client for Moshi |
| screenforge | `brew install --cask screenforge` | Screen recorder and timeline editor |
| simon-menubar | `brew install --cask simon-menubar` | Menu-bar system monitor |

ScreenForge installs the signed builds published at [dl.screenforge.studio](https://dl.screenforge.studio). The ScreenForge release workflow updates this tap when a build is uploaded, and `.github/workflows/screenforge.yml` checks [latest.json](https://dl.screenforge.studio/latest.json) every six hours in case that update did not land.
