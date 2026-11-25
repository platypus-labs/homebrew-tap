cask "platypusdb" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.13"
  sha256 arm:   "7dd3a9faa6d79db5c728123f1c510a09b66b1bbdd941bf920b87af0dd0585363",
         intel: "b7754a8b0ae1c5df802820b5e6d3ea6aef0db026a623ea270fdd4201c9574ecc"

  url "https://github.com/platypus-labs/platypus-db/releases/download/v#{version}/PlatypusDB_#{version}_#{arch}.dmg"
  name "PlatypusDB"
  desc "Fast, lightweight SQL client"
  homepage "https://github.com/platypus-labs/platypus-db"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "PlatypusDB.app"

  # Until the app is signed and notarized by Apple, Gatekeeper refuses to open it at first.
  caveats <<~EOS
    PlatypusDB is not signed by Apple yet. The first time, open it from Finder with
    right-click > Open, or remove the quarantine flag:
      xattr -dr com.apple.quarantine "#{appdir}/PlatypusDB.app"
  EOS

  zap trash: [
    "~/Library/Application Support/dev.platypusdb.desktop",
    "~/Library/Caches/dev.platypusdb.desktop",
    "~/Library/Logs/dev.platypusdb.desktop",
    "~/Library/WebKit/dev.platypusdb.desktop",
  ]
end
