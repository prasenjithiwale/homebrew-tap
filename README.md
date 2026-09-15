# Homebrew tap for Edge Notes

[Edge Notes](https://github.com/prasenjithiwale/edge-notes) is a notes widget
docked to the edge of your screen.

```bash
brew tap prasenjithiwale/tap
brew install --cask edge-notes
```

The disk image is downloaded from
<https://prasenjithiwale.github.io/edge-notes-apt/>, where the Linux and Windows
packages live too.

## About the quarantine step

The build is not signed with an Apple Developer ID and is not notarised, so macOS
refuses to open it while it carries the `com.apple.quarantine` attribute that
Homebrew puts on every cask it installs. The cask therefore strips that attribute
after installing, which is what `--no-quarantine` used to do before Homebrew
removed it in July 2026.

That means **the app is installed without a Gatekeeper check** — install it only
if you trust this tap. The `SHA256SUMS` file next to the disk image lets you
check the download, and the cask pins the same hash.

## This file is generated

`Casks/edge-notes.rb` is written by `tools/publish_cask.sh` in the source
repository and pushed here by its release workflow. An edit made here by hand is
overwritten by the next release.
