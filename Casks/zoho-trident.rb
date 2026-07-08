cask "zoho-trident" do
  version "1.38.1"
  sha256 "1b26eebf9c3bafbcda03a147e4b46940cbc31b861e54fb219ab487bdb3e1801b"

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
