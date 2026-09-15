cask "edge-notes" do
  version "0.0.4"
  sha256 "cb6714cd25a4e46786e2672a1ca28a78a33f0e2277bff218f36ec2313d967159"

  url "https://prasenjithiwale.github.io/edge-notes-apt/macos/Edge-Notes_#{version}_macOS_universal.dmg"
  name "Edge Notes"
  desc "Notes widget docked to the edge of the screen"
  homepage "https://github.com/prasenjithiwale/edge-notes"

  # Bare symbol, not ">= :monterey": Homebrew 7 deprecated the string form, and
  # this one already means "Monterey or newer" (its comparator defaults to >=).
  depends_on macos: :monterey

  app "Edge Notes.app"

  # The build is unsigned and unnotarised, so it cannot open while quarantined.
  # See tools/publish_cask.sh in the source repository for why this is here and
  # what would remove it.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Edge Notes.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.edgenotes.app",
    "~/Library/Caches/dev.edgenotes.app",
    "~/Library/HTTPStorages/dev.edgenotes.app",
    "~/Library/Preferences/dev.edgenotes.app.plist",
    "~/Library/Saved Application State/dev.edgenotes.app.savedState",
    "~/Library/WebKit/dev.edgenotes.app",
  ]
end
