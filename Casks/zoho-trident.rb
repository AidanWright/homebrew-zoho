cask "zoho-trident" do
  version "1.37.2"
  sha256 "e3c1a5b97013e5b837ee9c3058eb6129b2018d698a37d831ea392a77ca62e070"

  url "https://downloads.zohocdn.com/trident/mac/apple/Trident.dmg"
  name "Zoho Trident"
  desc "Desktop client for Zoho Mail, Calendar, and Cliq"
  homepage "https://www.zoho.com/trident/"

  livecheck do
    url "https://downloads.zohocdn.com/trident/mac/apple/Trident_appcast.xml"
    strategy :sparkle do |item|
      item.short_version
    end
  end

  app "Trident.app"

  uninstall quit: "com.zoho.trident.direct"

  zap trash: [
    "~/Library/Application Support/com.zoho.trident.direct",
    "~/Library/Caches/com.zoho.trident.direct",
    "~/Library/Preferences/com.zoho.trident.direct.plist",
  ]
end
