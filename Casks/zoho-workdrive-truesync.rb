cask "zoho-workdrive-truesync" do
  version "5.11.0"
  sha256 "a2fac025537e30e50064d6ace6f5becaf874e5776df7f95f7fdc6aaff245f93a"

  url "https://zohotruesync.nimbuspop.com/ZohoWorkDriveTS.pkg"
  name "Zoho WorkDrive TrueSync"
  desc "Desktop client for Zoho WorkDrive TrueSync"
  homepage "https://www.zoho.com/workdrive/truesync.html"

  livecheck do
    url "https://www.zoho.com/workdrive/truesync.html"
    strategy :page_match
    regex(/ZohoWorkDriveTS[._-]v?(\d+(?:\.\d+)+)\.pkg/i)
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
