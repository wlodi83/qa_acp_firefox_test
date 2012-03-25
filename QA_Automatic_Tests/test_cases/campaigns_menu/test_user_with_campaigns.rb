# encoding: UTF-8
require './ACP/acp.rb'

describe ACP do

  before do
  @explanation_hint_1 = "Number of downloads your campaign has generated today and number of downloads you have defined as daily cap." 
  @explanation_hint_2 = "Active means that your campaign is running. Pending means that your campaign is not running and requires action from your side. Click on campaign to find out what is missing."
  #connect with the database
  @campaigns_table = ["Testing the Routing Feature", "Blubberbla Test", "test", "asdasdasd",
                      "Tilt Mazes Testing escaping", "Test", "test", "53w5", "test"]
  @campaigns_table_asc = ["53w5", "asdasdasd", "Blubberbla Test", "test", "Test", "test", "test", 
                          "Testing the Routing Feature", "Tilt Mazes Testing escaping"] 
  @campaigns_table_desc = ["Tilt Mazes Testing escaping", "Testing the Routing Feature", "test", "Test", "test", "test",
                          "Blubberbla Test", "asdasdasd", "53w5"]
  @cpi_table = ["USD 1.00", "USD 0.50", "USD 0.50", "USD 0.50", "USD 0.50", "USD 0.65", "USD 0.50", "USD 0.50", "USD 0.50"]
  @cpi_table_asc = ["USD 0.50", "USD 0.50", "USD 0.50", "USD 0.50", "USD 0.50", "USD 0.50", "USD 0.50", 
                   "USD 0.65" , "USD 1.00"]
  @cpi_table_desc = ["USD 1.00", "USD 0.65", "USD 0.50", "USD 0.50", "USD 0.50", "USD 0.50", "USD 0.50", 
                   "USD 0.50", "USD 0.50"] 
  end

  it "should redirect user to Campaigns page with campaigns and displays correct conent on Campaigns page" do
    acp = ACP.new
    acp.go_to_login_page
    acp.fill_fields_with_user_credentials_with_campaigns
    sleep(5)
    acp.submit
    sleep(5)
    #go to Camapaigns Page
    acp.go_to_campaigns_page
    sleep(5)
    #find Campaigns header
    acp.find_campaigns_header.should eq("Campaigns")
    #find Name header
    acp.find_name_header.should eq("Name")
    #find App header
    acp.find_app_header.should eq("App")
    #find Platform header
    acp.find_platform_header.should eq("Platform")
    #find CPI header
    acp.find_cpi_header.should eq("CPI")
    #find Installs Today header
    acp.find_installs_today_header.should eq("Installs Today")
    #find Status header
    acp.find_status_header.should eq("Status")
    #find and display Explanation Text for Installs Today
    acp.find_and_display_explanation_text_for_installs_today
    #compare the displayed text from Installs Today explanation
    acp.find_and_compare_installs_today_explanation_text.should eq("#@explanation_hint_1")
    sleep(5)
    #find and display Explanation Text for Status
    acp.find_and_display_explanation_text_for_status
    #compare the display text from status explanation
    acp.find_and_compare_status_explanation_text.should eq("#@explanation_hint_2")
    #close browser
    acp.quit 
  end

 it "should redirect user to Campaigns page with campaigns and display correct content in campaings table" do
   acp = ACP.new
   acp.go_to_login_page
   acp.fill_fields_with_user_credentials_with_campaigns
   sleep(5)
   acp.submit
   sleep(5)
   acp.go_to_campaigns_page
   sleep(5)
   #find Campaigns in Name column
   acp.find_campaigns_in_name_column.should eq(@campaigns_table)
   #click to Name header and check that campaigns are in ascending order
   acp.click_to_name_header_first
   sleep(5)
   acp.find_campaigns_in_name_column_ascending.should eq(@campaigns_table_asc)
   sleep(5)
   #click to Name header again and check that campaigns are in descending order 
   acp.click_to_name_header_second
   sleep(5)
   acp.find_campaigns_in_name_column_descending.should eq(@campaigns_table_desc)
   #close browser
   acp.quit
  end

  it "should redirect user to Campaigns page with campaigns and display correct content in campaings table" do
    acp = ACP.new
    acp.go_to_login_page
    acp.fill_fields_with_user_credentials_with_campaigns
    sleep(5)
    acp.submit
    sleep(5)
    #click to Campaigns link
    acp.go_to_campaigns_page
    sleep(5)
    #find CPI values in CPI column
    acp.find_values_in_cpi_column.should eq(@cpi_table)
    sleep(5)
    #click to CPI header and check that CPI values are in ascending order
    acp.click_to_cpi_header_first
    sleep(5)
    acp.find_cpi_values_in_ascending_order.should eq(@cpi_table_asc) 
    #click to CPI header again and check that CPI values are in descending order
    acp.click_to_cpi_header_second
    sleep(5)
    acp.find_cpi_values_in_descending_order.should eq(@cpi_table_desc)
    #close browser
    acp.quit
  end

end
