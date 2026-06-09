cask "zoho-trident" do
  version "1.37.0"
  sha256 "e98ab97c604a1b1dfdb20d49176587f7123b902e79f5c4ab7f0494c452daca10"

  url "https://downloads.zohocdn.com/trident/mac/apple/Trident.dmg"
  name "Zoho Trident"
  desc "Desktop client for Zoho Mail, Calendar, and Cliq"
  homepage "https://www.zoho.com/trident/"

  livecheck do
    url "https://downloads.zohocdn.com/trident/mac/apple/Trident.dmg"
    strategy :header_match
  end

  app "Trident.app"

  uninstall quit: "com.zoho.trident.direct"

  zap trash: [
    "~/Library/Application Support/com.zoho.trident.direct",
    "~/Library/Caches/com.zoho.trident.direct",
    "~/Library/Preferences/com.zoho.trident.direct.plist",
  ]
end
