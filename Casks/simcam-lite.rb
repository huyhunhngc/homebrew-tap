cask "simcam-lite" do
  version "0.2.0"
  sha256 "764fdab165b7b8d162e53a5e66acf9fac62e8316e1bd2b39fcc90f9905efb0a5"

  url "https://github.com/huyhunhngc/SimCamLite/releases/download/v#{version}/SimCamLite-#{version}.dmg"
  name "SimCam Lite"
  desc "Camera for the iOS Simulator"
  homepage "https://github.com/huyhunhngc/SimCamLite"

  livecheck do
    url "https://simcamupdates.ifateam.dev/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "SimCamLite.app"
  binary "#{appdir}/SimCamLite.app/Contents/MacOS/simcam"

  uninstall quit: "dev.ifateam.simcamlite"

  zap trash: [
    "/Users/Shared/SimCamLite",
    "~/Library/Caches/dev.ifateam.simcamlite",
    "~/Library/HTTPStorages/dev.ifateam.simcamlite",
    "~/Library/Preferences/dev.ifateam.simcamlite.plist",
    "~/Library/Saved Application State/dev.ifateam.simcamlite.savedState",
  ]
end
