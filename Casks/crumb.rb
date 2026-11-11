cask "crumb" do
  version "1.0.0"
  sha256 "ac4d967d9e2363753c4f71ea1b8ed0f06a2c9cfe1e49a98c409fa949859c46af"

  url "https://crumb-cdn.justswish.in/releases/Crumb-#{version}.zip"
  name "Crumb"
  desc "Command bar agent for ordering on Swish"
  homepage "https://crumb.justswish.in/"

  livecheck do
    url "https://crumb-cdn.justswish.in/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Crumb.app"

  uninstall quit: "in.justswish.crumb-bar"

  zap trash: [
    "~/Library/Application Support/in.justswish.crumb-bar",
    "~/Library/Caches/in.justswish.crumb-bar",
    "~/Library/HTTPStorages/in.justswish.crumb-bar",
    "~/Library/Preferences/in.justswish.crumb-bar.plist",
  ]
end
