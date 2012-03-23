require './ACP/acp.rb'

describe ACP do
  it "registered user should go to login page and after click login see the flash message that password or email are wrong" do
   acp = ACP.new
   acp.go_to_login_page
   acp.fill_fields_with_fake_credentials
   sleep(5)
   acp.submit
   acp.return_flashbox.should eq("Invalid email or password")
   sleep(5)
   acp.quit
  end
end

