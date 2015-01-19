require 'rubygems'
require 'selenium-webdriver'
require "test/unit"
require_relative 'environment'

CONST = Environment::URL

class MedicationList < Test::Unit::TestCase
	def setup
		$driver = Selenium::WebDriver.for :chrome
    	$driver.get(CONST)
    	$wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

	def test_medicationList
		sleep 8
		$driver.find_element(:id, 'Medications').click
		sleep 8
		medication_list = $driver.find_element :xpath => '//*[@id="medication_list"]/div[1]/div/div[2]/ul'
		sleep 8
		$driver.find_elements(:xpath, '//*[@id="medication_list"]/div[1]/div/div[2]/ul')
		element_medication = medication_list.find_elements :tag_name => 'li'

		element_medication.each do |med|
			med.click
			sleep 5

		end
		
	end
	begin
		def teardown
    	$driver.quit
    	end
	end
  end