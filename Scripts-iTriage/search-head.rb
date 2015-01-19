require 'rubygems'
require 'selenium-webdriver'
require "test/unit"


CONST = "https://www.itriagehealth.com"

class SearchHead < Test::Unit::TestCase
	def setup
		$driver = Selenium::WebDriver.for :firefox
    	$driver.get(CONST)
    	$wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

	def test_searchhead
		
		$wait.until {$driver.find_element(:link, 'Avatar')}
		$driver.find_element(:link, 'Avatar').click
		sleep 5
		$driver.find_element(:link, 'Symptoms List').click
		sleep 5
		searchbox = $wait.until {$driver.find_element(:name, 'searchPane')}
		sleep 5
		searchbox.send_keys "head"
		sleep 5
		#textsearch = searchPane.find_element :name => 'searchPane'
		#textsearch.send_keys "head"
		

	end

	begin
		def teardown
    	$driver.quit
    	end
	end
end
