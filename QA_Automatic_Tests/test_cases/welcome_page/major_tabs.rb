# encoding: UTF-8
require './ACP/acp.rb'
require './database/staging.rb'

describe ACP do
  before (:all) do
  #connect with Staging database
  @connection = Staging.new("", "")
  @connection.connect
  @connection.do_query("select count(*) from cms_db_production.programs as pr join cms_db_production.advertisers as adv on pr.advertiser_id = adv.id join cms_db_production.companies as comp on adv.company_id = comp.id where comp.id = '13913' and pr.deleted_at IS NULL;")
  @number_of_active_campaigns = @connection.print_result_array
  end

  it "registered user should go to login page and after login see right content" do
   acp = ACP.new
   acp.go_to_login_page
   acp.fill_fields
   sleep(5)
   acp.submit
   result = ["En", "Japanese", "Łukasz", "Włodarczyk", "Active", "campaigns:", "0", "Current", "balance:", "+", "EUR", "0.00", "Log", "out", "Campaigns", "Reporting", "Billing", "Account", "Support"]
   #find greyed bar
   acp.find_greyed_bar.should eq(result)
   #find logo SP and src
   src = "http://staging.acp.sponsorpay.com/assets/sponsorpay-logo-e8d21aaf5d78794203fbe5567e15f530.png"
   acp.find_sp_logo.should eq(src)
   #find langauge dropdown
   acp.find_language_dropdown.should eq("En")
   #find user name link
   acp.find_user_name_link.should eq("http://staging.acp.sponsorpay.com/13913/password/edit")
   #find active campaigns link
   acp.find_active_campaigns.should eq("http://staging.acp.sponsorpay.com/13913/campaigns")
   #find amount of active campaigns
   acp.find_amount_of_active_campaigns.should eq (@number_of_active_campaigns)
   #find current balance
   #TODO check in database
   acp.find_current_balance.should eq("http://staging.acp.sponsorpay.com/13913/billing/balance")
   #find log out link
   acp.find_log_out.should eq("http://staging.acp.sponsorpay.com/users/sign_out")
   #find Camapigns link
   acp.find_campaigns_link.should eq("http://staging.acp.sponsorpay.com/13913/campaigns")
   #find Reporting link
   acp.find_reporting_link.should eq("http://staging.acp.sponsorpay.com/13913/reporting")
   #find Billing link
   acp.find_billing_link.should eq("http://staging.acp.sponsorpay.com/13913/billing/balance")
   #find Account link
   acp.find_account_link.should eq("http://staging.acp.sponsorpay.com/13913/password/edit")
   #find Support link
   acp.find_support_link.should eq("http://staging.acp.sponsorpay.com/13913/support/faq")
   #close browser session
   acp.quit
  end

  after (:all) do
    @connection.disconnect
  end
end
