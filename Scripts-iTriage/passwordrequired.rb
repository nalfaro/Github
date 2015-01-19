require 'rubygems'
require 'selenium-webdriver'
require "test/unit"
require_relative 'environment'

CONST = Environment::URL

class PasswordRequired < Test::Unit::TestCase
	def setup
		$driver = Selenium::WebDriver.for :chrome
    	$driver.get(CONST)
    	$wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

	def test_passwordRequired
		sleep 6
		$driver.find_element(:id, 'login').click
		sleep 6
		email_box = $driver.find_element :class =>'form-email'
		email_box.click
		email_box.send_keys "nalfaro+testprod02@itriagehealth.com"
		$driver.find_element(:css, "#tb-modal > div.modal-body > div > div > form > button").click
		sleep 5
		alert = $driver.find_element :css =>'#tb-modal > div.modal-body > div > div > form > ul > li' #VERIFY ERROR MESSAGE SHOWS UP
		password_box = $driver.find_element :css => '#tb-modal > div.modal-body > div > div > form > input.form-password.error'
		password_box.click
		password_box.send_keys "Test1234"
		$driver.find_element(:css, "#tb-modal > div.modal-body > div > div > form > button").click
		sleep 8
		$driver.find_element(:id, 'My-iTriage').click
		sleep 6
	end
	begin
		def teardown
    	$driver.quit
    	end
	end
  end