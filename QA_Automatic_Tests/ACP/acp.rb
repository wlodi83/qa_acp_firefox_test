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

  def check_any_campaigns_text
    @element = @driver.find_element(:css, "table.stats").find_element(:css, "tbody").find_element(:css, "tr").find_element(:css, "td.nocampaign")
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

  def find_current_balance
    @element = @driver.find_element(:link_text => "Current balance: + EUR 0.00")
    @element.attribute("href")
  end

  def find_log_out
    @element = @driver.find_element(:link_text => "Log out")
    @element.attribute("href")
  end

  def find_campaigns_link
    @element = @driver.find_element(:link_text => "Campaigns")
    @href = @element.attribute("href")
    @element.click
    sleep(5)
    @driver.navigate.back
    return @href
  end

  def find_reporting_link
    @element = @driver.find_element(:link_text => "Reporting")
    @href = @element.attribute("href")
    @element.click
    sleep(5)
    @driver.navigate.back
    return @href
  end

  def find_billing_link
    @element = @driver.find_element(:link_text => "Billing")
    @href = @element.attribute("href")
    @element.click
    sleep(5)
    @driver.navigate.back
    return @href
  end

  def find_account_link
    @element = @driver.find_element(:link_text => "Account")
    @href = @element.attribute("href")
    @element.click
    sleep(5)
    @driver.navigate.back
    return @href
  end

  def find_support_link
    @element = @driver.find_element(:link_text => "Support")
    @href = @element.attribute("href")
    @element.click
    sleep(5)
    @driver.navigate.back
    return @href
  end

  def check_add_campaign_button
    @element = @driver.find_element(:link_text => "Add campaign")
    @href = @element.attribute("href")
    @element.click
    sleep(5)
    @driver.navigate.back
    return @href
  end

  def go_to_campaigns_page
    @element = @driver.find_element(:link_text => "Campaigns")
    @element.click
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
  
  def find_campaigns_header
    @element = @driver.find_element(:css, "div#contentFull h2")
    @element.text
  end
 
  def fill_fields
    @element = @driver.find_element(:name, 'user[email]')
    @element.send_keys "lukasz.wlodarczyk@yahoo.com"
    @element = @driver.find_element(:name, 'user[password]')
    @element.send_keys "********"
  end

  def fill_fields_with_fake_credentials
    @element = @driver.find_element(:name, 'user[email]')
    @element.send_keys "wrong_email@sponsorpay.com"
    @element = @driver.find_element(:name, 'user[password]')
    @element.send_keys "wrong_password"
  end

  #Campaigns submenu
  def fill_fields_with_user_credentials_with_campaigns
    @element = @driver.find_element(:name, 'user[email]')
    @element.send_keys "felix.speiser@sponsorpay.com"
    @element = @driver.find_element(:name, 'user[password]')
    @element.send_keys "********"
  end

  def find_name_header
    @element = @driver.find_element(:link_text, "Name")
    @element.text
  end

  def find_app_header
    @element = @driver.find_element(:link_text, "App")
    @element.text
  end

  def find_platform_header
    @element = @driver.find_element(:xpath, "//table[@class='stats']//thead//tr//th[4]")
    @element.text
  end

  def find_cpi_header
    @element = @driver.find_element(:link_text, "CPI")
    @element.text
  end

  def find_installs_today_header
    @element = @driver.find_element(:link_text, "Installs Today")
    @element.text
  end
 
  def find_and_display_explanation_text_for_installs_today
    @element = @driver.find_element(:xpath, "//table[@class='stats']//thead//tr//th[6]//div[@class='infoBoxcontainer']//p[@class='inline-hints']//span[@class='icon']")
    @element.click
  end
 
  def find_and_compare_installs_today_explanation_text
    @element = @driver.find_element(:xpath, "//table[@class='stats']//thead//tr//th[6]//div[@class='infoBoxcontainer infoBoxcontainerShown']//p[@class='inline-hints']//span[@class='hint']")
    @element.text
  end

  def find_and_display_explanation_text_for_status
    @element = @driver.find_element(:xpath, "//table[@class='stats']//thead//tr//th[7]//div[@class='infoBoxcontainer']//p[@class='inline-hints']//span[@class='icon']")
    @element.click
  end
 
  def find_and_compare_status_explanation_text
    @element = @driver.find_element(:xpath, "//table[@class='stats']//thead//tr//th[7]//div[@class='infoBoxcontainer infoBoxcontainerShown']//p[@class='inline-hints']//span[@class='hint']")
    @element.text
  end
  
  def find_status_header
    @element = @driver.find_element(:xpath, "//table[@class='stats']//thead//tr//th[7]")
    @element.text
  end

  def find_campaigns_in_name_column
    @campaigns_table = Array.new
    @element = @driver.find_elements(:xpath, "//table[@class='stats']//tbody//a").each do |link|
      @campaigns_table.push(link.attribute("text"))
    end
    @campaigns_table.delete_if { |e| e == "\n" }
  end

  def click_to_name_header_first
    @element = @driver.find_element(:link_text, "Name")
    @element.click
  end

  def find_campaigns_in_name_column_ascending
    @campaigns_table = Array.new
    @element = @driver.find_elements(:xpath, "//table[@class='stats']//tbody//a").each do |link|
      @campaigns_table.push(link.attribute("text"))
    end
    @campaigns_table.delete_if { |e| e == "\n" }
  end

  def click_to_name_header_second
    @element = @driver.find_element(:link_text, "Name ▲")
    @element.click
  end

  def find_campaigns_in_name_column_descending
    @campaigns_table = Array.new
    @element = @driver.find_elements(:xpath, "//table[@class='stats']//tbody//a").each do |link|
      @campaigns_table.push(link.attribute("text"))
    end
    @campaigns_table.delete_if { |e| e == "\n" }
  end

  def find_values_in_cpi_column
    @cpi_table = Array.new
    @element = @driver.find_elements(:xpath, "//table[@class='stats']//tbody//tr//td[5]").each do |el|
      @cpi_table.push(el.text)
    end
    return @cpi_table
  end

  def click_to_cpi_header_first
    @element = @driver.find_element(:link_text, "CPI")
    @element.click
  end

  def click_to_cpi_header_second
    @element = @driver.find_element(:link_text, "CPI ▲")
    @element.click
  end

  def find_cpi_values_in_ascending_order
    @cpi_table_asc = Array.new
    @element = @driver.find_elements(:xpath, "//table[@class='stats']//tbody//tr//td[5]").each do |el|
      @cpi_table_asc.push(el.text)
    end
    return @cpi_table_asc
  end

  def find_cpi_values_in_descending_order
    @cpi_table_desc = Array.new
    @element = @driver.find_elements(:xpath, "//table[@class='stats']//tbody//tr//td[5]").each do |el|
      @cpi_table_desc.push(el.text)
    end
    return @cpi_table_desc
  end

  #end Campaings Menu

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
