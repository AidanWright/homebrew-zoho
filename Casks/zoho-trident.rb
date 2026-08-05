cask "zoho-trident" do
  version "1.38.2"
  sha256 "48ca8a4dc0166d9155b0d80321aac98bbe5f8fba38d64f728d8b9e28e837942f"

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
