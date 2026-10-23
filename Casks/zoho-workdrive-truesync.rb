cask "zoho-workdrive-truesync" do
  version "5.17.1"
  sha256 "38f3d4ef3d65bf68160b7705b7d370f8e3d8b6d75d5b7354e35cb59b14fcc5bc"

  url "https://zohotruesync.nimbuspop.com/ZohoWorkDriveTS.pkg"
  name "Zoho WorkDrive TrueSync"
  desc "Desktop client for Zoho WorkDrive TrueSync"
  homepage "https://www.zoho.com/workdrive/truesync.html"

  livecheck do
    url "https://files-accl.zohopublic.com/public/tsmac/download/c488f53fb0fe339a8a3868a16d56ede6"
    strategy :header_match do |headers|
      headers["etag"]&.match(/(\d+(?:\.\d+)+)/)&.captures&.first
    end
  end

  pkg "ZohoWorkDriveTS.pkg"

  uninstall pkgutil: "org.zoho.ZohoWorkDriveTrueSync"

  zap trash: [
    "~/Library/Application Support/ZohoWorkDriveTrueSync",
    "~/Library/Caches/com.zoho.workdrive.truesync",
    "~/Library/Preferences/com.zoho.workdrive.truesync.plist",
    "~/Library/CloudStorage/ZohoWorkDrive-*",
  ]
end
