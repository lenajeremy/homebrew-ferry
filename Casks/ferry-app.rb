cask "ferry-app" do
  version "1.0.0"
  sha256 "c29a60e1382dddef55dfd06e3ed84028d1975da16dd1911340780637cbd72dcf"

  url "https://github.com/lenajeremy/ferry/releases/download/v1.0.0/Ferry-mac.dmg"
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
