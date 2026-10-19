cask "ferry-app" do
  version "1.0.1"
  sha256 "84cfb60931915d76cc231b2a7d290b48fc8224c447a11a262a2cbbb49e83dc96"

  url "https://github.com/lenajeremy/ferry/releases/download/v1.0.1/Ferry-mac.dmg"
  name "Ferry"
  desc "Send photos, videos and files between your phone and computer over Wi-Fi"
  homepage "https://github.com/lenajeremy/ferry"

  depends_on macos: ">= :big_sur"

  app "Ferry.app"

  zap trash: [
    "~/Library/Application Support/Ferry",
    "~/Library/Preferences/app.ferry.desktop.plist",
  ]
end
