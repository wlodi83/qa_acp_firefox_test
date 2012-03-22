require './ACP/acp.rb'

describe ACP do
  it "registered user should go to login page and after login see welcome page" do
   acp = ACP.new
   acp.go_to_login_page
   acp.fill_fields
   sleep(5)
   acp.submit
   acp.return_title.should eq("[S] - SponsorPay - CPI Advertising")
   acp.return_important_notice_header.should eq("Important Notice")
   acp.quit
  end
end
