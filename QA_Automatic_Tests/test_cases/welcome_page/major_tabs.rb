# encoding: UTF-8
require './ACP/acp.rb'
require 'dbi'

describe ACP do
  before (:all) do
   #connect with database
     begin
       # connect to the MySQL server
       @dbh = DBI.connect("DBI:Mysql:ids_db_production:10.2.10.1:3306",
                      "******", "******")
       # get server version string and display it
       row = @dbh.select_one("select * from cms_db_production.programs as pr join cms_db_production.advertisers as adv on pr.advertiser_id = adv.id join cms_db_production.companies as comp on adv.company_id = comp.id where comp.id = '13913' and pr.deleted_at IS NULL;;")
       puts row

    rescue DBI::DatabaseError => e
      puts "An error occurred"
      puts "Error code:    #{e.err}"
      puts "Error message: #{e.errstr}"
    ensure
      # disconnect from server
      @dbh.disconnect if @dbh
    end

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
   acp.quit
  end
end
