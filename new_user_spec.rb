require_relative 'acp_firefox'

describe AcpFirefox do
  it "a non registered user when click on register should be redirected to account cretion page" do
   acp_firefox = AcpFirefox.new
   acp_firefox.go_to_login_page
   acp_firefox.click_register
   #checking the title of page
   acp_firefox.return_title.should eq("[S] - SponsorPay - CPI Advertising")
   acp_firefox.return_register_header.should eq("Register now for our Advertiser Control Panel")
   acp_firefox.quit
  end
end
