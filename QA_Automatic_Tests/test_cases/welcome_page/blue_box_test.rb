require './ACP/acp.rb'

describe ACP do
  it "registered user should go to login page and after login see blue square" do
   acp = ACP.new
   acp.go_to_login_page
   acp.fill_fields
   sleep(5)
   acp.submit
   acp.return_title.should eq("[S] - SponsorPay - CPI Advertising")
   acp.return_blue_square.should eq("Important Notice\nWith the release of our new version of the Android SDK on 7th of November, 2011 the PROGRAM_ID in this control panel has changed its name to AppID.\nThis does not affect existing integrations. However, if you are going to update your integration with the new SDK version 1.3.1 (Android) and 1.2.2 (iOS) or newer, make sure you get the new AppID for your campaign and include it in the SPONSORPAY_APP_ID parameter in your Application Manifest.")
   acp.quit
  end
end
