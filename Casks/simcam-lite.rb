cask "simcam-lite" do
  version "0.2.7"
  sha256 "3af362ea5e905b66aa49734e5f2500f1722dd5fab05528798abff3b988221e24"

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
