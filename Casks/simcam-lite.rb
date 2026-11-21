cask "simcam-lite" do
  version "0.2.1"
  sha256 "daf135eeb9562268534ef09c9a621cfcb356a0c5f6f2d546dda68f928f50dea1"

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
