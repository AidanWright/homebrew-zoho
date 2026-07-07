cask "zoho-workdrive-truesync" do
  version "5.12.0"
  sha256 "8f1bb2d50c26fc2fa2945ff1e9ef1b3f0aea14f6674ca4f32f6cc09de456324c"

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
