cask "simcam-lite" do
  version "0.2.8"
  sha256 "b99e54bfbe740f8ec4f8519db2e86a3a2511194456c5f2de81884bfb716384d7"

  url "https://github.com/huyhunhngc/simulator-camera/releases/download/v#{version}/SimCamLite-#{version}.dmg"
  name "SimCam Lite"
  desc "Camera for the iOS Simulator"
  homepage "https://github.com/huyhunhngc/simulator-camera"

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
