cask "platypusdb" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.12"
  sha256 arm:   "3d02067e6104643a33fb99ddcc082d28d7ac7b42cfb7dd7564f9a5dbba0fc3ec",
         intel: "2cd6e728bb2f385c4d97ae73df847985051d8683717c7396c3d0e1cbbb98b822"

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
