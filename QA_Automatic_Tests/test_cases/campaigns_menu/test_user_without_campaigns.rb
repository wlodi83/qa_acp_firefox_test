# encoding: UTF-8
require './ACP/acp.rb'

describe ACP do

  it "registered user go to Campaigns page and should see correct content if he has no campaigns" do
    acp = ACP.new
    acp.go_to_login_page
    acp.fill_fields
    sleep(5)
    acp.submit
    #user goes to Campaigns page
    acp.go_to_campaigns_page
    sleep(5)
    #check that there is text /"You haven't created any campaigns yet/" displayed
    acp.check_any_campaigns_text.should eq("You haven't created any campaigns yet")
    #find a button Add Campaign
    acp.check_add_campaign_button.should eq("http://staging.acp.sponsorpay.com/13913/campaigns/new")
    acp.quit
  end

end
