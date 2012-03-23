# encoding: UTF-8
require './ACP/acp.rb'

describe ACP do
  it "registered user should go to login page and after login see welcome text with the link" do
   acp = ACP.new
   acp.go_to_login_page
   acp.fill_fields
   sleep(5)
   acp.submit
   acp.return_title.should eq("[S] - SponsorPay - CPI Advertising")
   acp.return_welcome_text.should eq("Important Notice\nWith the release of our new version of the Android SDK on 7th of November, 2011 the PROGRAM_ID in this control panel has changed its name to AppID.\nThis does not affect existing integrations. However, if you are going to update your integration with the new SDK version 1.3.1 (Android) and 1.2.2 (iOS) or newer, make sure you get the new AppID for your campaign and include it in the SPONSORPAY_APP_ID parameter in your Application Manifest.\nHello Łukasz Włodarczyk,\nWelome to SponsorPay's new Campaign Control Panel which allows you to easily create, edit and monitor your advertising campaigns. Keep posted for upcoming releases with exciting new feautures!\nIf you are here for the first time we recommend you go to our support section.\nCreate new campaigns and check how active campaigns are performing in our campaign section. Don’t forget to enter all your company data to get your campaign active.\nYou need any assistance or want to give us feedback on missing functionalities? We are looking forward to receive your email!")
   links_text = ["support section", "campaign section", "company data", "your email"]
   links_href = ["http://staging.acp.sponsorpay.com/13913/support/faq", "http://staging.acp.sponsorpay.com/13913/campaigns", "http://staging.acp.sponsorpay.com/13913/contact/edit", "mailto:acp-support@sponsorpay.com"]
   acp.find_welcome_links_text.should eq(links_text)
   acp.find_welcome_links_href.should eq(links_href)
   acp.quit
  end
end
