# The token stays edge-notes although the app is Ledge now: it is what an
# existing install is upgraded by, and changing it would strand everyone who has
# already installed from this tap on 0.0.4.
#
# No backticks anywhere in this heredoc: it is unquoted, so the shell would run
# what is between them while generating the cask.
cask "edge-notes" do
  version "0.9.0"
  sha256 "e4c18daf350e0801eeecc4f66e74401167a98ebe14c8e5f137add18ec0a27908"

  url "https://prasenjithiwale.github.io/edge-notes-apt/macos/Ledge_#{version}_macOS_universal.dmg"
  name "Ledge"
  desc "Notes widget docked to the edge of the screen"
  # The site, not the source repository: that one is private and a cask
  # homepage is something people click.
  homepage "https://prasenjithiwale.github.io/edge-notes-apt/"

  # Bare symbol, not ">= :monterey": Homebrew 7 deprecated the string form, and
  # this one already means "Monterey or newer" (its comparator defaults to >=).
  depends_on macos: :monterey

  # The app updates itself (idea 6), so brew upgrade leaves an install alone
  # unless asked with --greedy, rather than fighting the app over the version.
  auto_updates true

  app "Ledge.app"

  # The build is unsigned and unnotarised, so it cannot open while quarantined.
  # See tools/publish_cask.sh in the source repository for why this is here and
  # what would remove it.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Ledge.app"]
  end

  # Both identifiers: the app was dev.edgenotes.app up to 0.0.4, and an install
  # upgraded from it copied its database across but left the old folder behind.
  zap trash: [
    "~/Library/Application Support/dev.ledge.app",
    "~/Library/Application Support/dev.edgenotes.app",
    "~/Library/Caches/dev.ledge.app",
    "~/Library/Caches/dev.edgenotes.app",
    "~/Library/HTTPStorages/dev.ledge.app",
    "~/Library/HTTPStorages/dev.edgenotes.app",
    "~/Library/Preferences/dev.ledge.app.plist",
    "~/Library/Preferences/dev.edgenotes.app.plist",
    "~/Library/Saved Application State/dev.ledge.app.savedState",
    "~/Library/Saved Application State/dev.edgenotes.app.savedState",
    "~/Library/WebKit/dev.ledge.app",
    "~/Library/WebKit/dev.edgenotes.app",
  ]
end
