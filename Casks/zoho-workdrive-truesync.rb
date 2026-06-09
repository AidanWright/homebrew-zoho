cask "zoho-workdrive-truesync" do
  version "5.11.0"
  sha256 "a2fac025537e30e50064d6ace6f5becaf874e5776df7f95f7fdc6aaff245f93a"

  url "https://zohotruesync.nimbuspop.com/ZohoWorkDriveTS.pkg"
  mirror "https://files-accl.zohopublic.com/public/tsmac/download/c488f53fb0fe339a8a3868a16d56ede6"
  name "Zoho WorkDrive TrueSync"
  desc "Zoho WorkDrive sync client with File Provider support"
  homepage "https://www.zoho.com/workdrive/"

  pkg "ZohoWorkDriveTS.pkg"

  uninstall pkgutil: "org.zoho.ZohoWorkDriveTrueSync"

  zap trash: [
    "~/Library/Application Support/ZohoWorkDriveTrueSync",
    "~/Library/Caches/com.zoho.workdrive.truesync",
    "~/Library/Preferences/com.zoho.workdrive.truesync.plist",
    "~/Library/CloudStorage/ZohoWorkDrive-*",
  ]
end
