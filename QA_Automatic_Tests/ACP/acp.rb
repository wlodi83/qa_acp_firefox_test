# encoding: UTF-8

require "selenium-webdriver" 

class ACP

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

  def return_important_notice_header
    @element = @driver.find_element(:css, "div#apiChangePingId h3")
    @element.text
  end

  def return_blue_square
    @element = @driver.find_element(:css, "div#apiChangePingId")
    @element.text
  end

  def return_welcome_text
    @element = @driver.find_element(:css, "div#content")
    @element.text
  end

  def find_greyed_bar
    @element = @driver.find_element(:css, "header")
    @element.text.split
  end

  def find_sp_logo
    @element = @driver.find_element(:css, "img#logo")
    @element.attribute("src")
  end

  def find_language_dropdown
    @element = @driver.find_element(:css, "select#language").find_element(:css, "option[value='en']")
    @element.text
  end

  def find_user_name_link
    @element = @driver.find_element(:link_text => "Łukasz Włodarczyk")
    @element.attribute("href")
  end

  def find_active_campaigns
    @element = @driver.find_element(:link_text => "Active campaigns: 0")
    @element.attribute("href")
  end

  def find_welcome_links_text
    @links_text = Array.new
    @element = @driver.find_elements(:xpath, "//div[@class='clearfix']//a").each do |link|
    @links_text.push(link.attribute("text"))
    end
    return @links_text
  end

  def find_welcome_links_href
    @links_href = Array.new
    @element = @driver.find_elements(:xpath, "//div[@class='clearfix']//a").each do |link|
    @links_href.push(link.attribute("href"))
    end
    return @links_href
  end
 
  def fill_fields
    @element = @driver.find_element(:name, 'user[email]')
    @element.send_keys "lukasz.wlodarczyk@yahoo.com"
    @element = @driver.find_element(:name, 'user[password]')
    @element.send_keys "*******"
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
