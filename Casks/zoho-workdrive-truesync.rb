cask "zoho-workdrive-truesync" do
  version "5.14.0"
  sha256 "655eb31548b86a597bda25d7f128516f1104e4a7259124e96bc7db7d43475831"

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
