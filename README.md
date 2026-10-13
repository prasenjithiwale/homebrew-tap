# Homebrew tap

Edge Notes and kaffy, by Prasenjit Vijay Hiwale.

## Edge Notes

[Edge Notes](https://github.com/prasenjithiwale/edge-notes) is a notes widget
docked to the edge of your screen.

```bash
brew trust --cask prasenjithiwale/tap/edge-notes
brew install --cask prasenjithiwale/tap/edge-notes
```

Homebrew will not load a cask from a tap outside its own repositories until you
say you trust it, which is what the first line is; the second adds the tap and
installs. Afterwards the short name works: `brew upgrade edge-notes`.

The disk image is downloaded from
<https://prasenjithiwale.github.io/edge-notes-apt/>, where the Linux and Windows
packages live too.

### About the quarantine step

The build is not signed with an Apple Developer ID and is not notarised, so macOS
refuses to open it while it carries the `com.apple.quarantine` attribute that
Homebrew puts on every cask it installs. The cask therefore strips that attribute
after installing, which is what `--no-quarantine` used to do before Homebrew
removed it in July 2026.

That means **the app is installed without a Gatekeeper check** — install it only
if you trust this tap. The `SHA256SUMS` file next to the disk image lets you
check the download, and the cask pins the same hash.

### This file is generated

`Casks/edge-notes.rb` is written by `tools/publish_cask.sh` in the source
repository and pushed here by its release workflow. An edit made here by hand is
overwritten by the next release.

## kaffy

[kaffy](https://prasenjithiwale.github.io/folio/kaffy/) is a terminal UI for
exploring and operating Kafka clusters, for macOS and Linux.

```bash
brew trust --formula prasenjithiwale/tap/kaffy
brew install prasenjithiwale/tap/kaffy
```

As with the cask, the first line tells Homebrew you trust this formula. Then
`kaffy --demo` runs it against a built-in fake cluster, and `brew upgrade kaffy`
picks up new releases.

kaffy is a command-line binary rather than an app, so Homebrew does not
quarantine it and there is no Gatekeeper step. The archives are downloaded from
<https://prasenjithiwale.github.io/folio/kaffy/releases/>, with their SHA-256
checksums alongside; the formula pins the same hashes.

`Formula/kaffy.rb` is written by kaffy's release workflow; an edit made here by
hand is overwritten by the next release.
