require './ACP/acp.rb'

describe ACP do
  it "a non registered user when click on register should be redirected to account cretion page" do
   acp = ACP.new
   acp.go_to_login_page
   sleep(5)
   acp.click_register
   #checking the title of page
   acp.return_title.should eq("[S] - SponsorPay - CPI Advertising")
   acp.return_register_header.should eq("Register now for our Advertiser Control Panel")
   acp.quit
  end
end
