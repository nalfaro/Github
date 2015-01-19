require 'rubygems'
require 'selenium-webdriver'
require "test/unit"
require_relative 'environment'

CONST = Environment::URL

class My_ItriageInsurance < Test::Unit::TestCase
	def setup
		$driver = Selenium::WebDriver.for :chrome
    	$driver.get(CONST)
    	$wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

	def test_myItriageInsurance
		sleep 6
		$driver.find_element(:id, 'My-iTriage').click
		sleep 6
		email_box = $driver.find_element :class =>'form-email'
		email_box.click
		email_box.send_keys "nalfaro+testprod02@itriagehealth.com"
		password_box = $driver.find_element :class => 'form-password'
		password_box.click
		password_box.send_keys "Test1234"
		$driver.find_element(:xpath, "//button[@type='submit']").click
		sleep 8
		$driver.find_element(:link, "My Insurance").click
		sleep 8
		Selenium::WebDriver::Support::Select.new($driver.find_element(:id, "carrier_id")).select_by(:text, "EBMS")
		sleep 8
		$driver.find_element(:xpath, "//button[@type='button']").click
	end
	begin
		def teardown
    	$driver.quit
    	end
	end
  end