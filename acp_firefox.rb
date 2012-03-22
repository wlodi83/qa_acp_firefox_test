require "selenium-webdriver" 

class AcpFirefox

  def initialize
    @driver = Selenium::WebDriver.for :firefox
  end

  def go_to_login_page
    @driver.navigate.to "http://staging.acp.sponsorpay.com/"
  end

  def click_register
    @element = @driver.find_element(:link_text => "Not registered yet?").click
  end

  def return_register_header
    @element = @driver.find_element(:css, "div#content h2")
    @element.text
  end
 
  def fill_fields
    @element = @driver.find_element(:name, 'user[email]')
    @element.send_keys "lukasz.wlodarczyk@yahoo.com"
    @element = @driver.find_element(:name, 'user[password]')
    @element.send_keys "wrong_password"
  end

  def fill_fields_with_fake_credentials
    @element = @driver.find_element(:name, 'user[email]')
    @element.send_keys "wrong_email@sponsorpay.com"
    @element = @driver.find_element(:name, 'user[password]')
    @element.send_keys "wrong_password"
  end

  def submit
    @element.submit
  end

  def return_flashbox
   @element = @driver.switch_to.active_element
   @element.text.match("Invalid email or password").to_s
  end

  def return_title
    @driver.title
  end

  def quit
    @driver.quit
  end

end
