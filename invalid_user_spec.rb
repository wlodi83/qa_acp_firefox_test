require_relative 'acp_firefox'

describe AcpFirefox do
  it "registered user should go to login page and after login see welcome page" do
   acp_firefox = AcpFirefox.new
   acp_firefox.go_to_login_page
   acp_firefox.fill_fields_with_fake_credentials
   acp_firefox.submit
   acp_firefox.return_flashbox.should eq("Invalid email or password")
   acp_firefox.quit
  end
end

