require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require_relative 'environment'

CONST = Environment::URL


class Main_iTriage < Test::Unit::TestCase
		
	def setup
		$driver = Selenium::WebDriver.for :chrome
    	$driver.get(CONST)
    	$wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end
	
	def test_main_iTriage
		$driver.find_element(:id, 'Avatar').click
		sleep 10
		$driver.find_element(:id, 'Doctors').click
		$driver.find_element(:id, 'Facilities').click
		$driver.find_element(:id, 'Conditions').click
		$driver.find_element(:id, 'Medications').click
		$driver.find_element(:id, 'Procedures').click
		$driver.find_element(:id, 'My-iTriage').click
		$driver.find_element(:id, 'News').click
		element_search = $driver.find_element :name => 'search'
		element_search.click
		element_search.send_keys "asma"
		$driver.action.send_keys(element_search, :return).perform
		element_doctor = $wait.until {$driver.find_element(:link, 'Dr. ASMA ALI')}
		element_doctor.click
		
	end
	
	def teardown
    	$driver.quit
    end
  
  end

 
 