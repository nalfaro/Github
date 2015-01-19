require 'rubygems'
require 'selenium-webdriver'
require "test/unit"
require_relative 'environment'

CONST = Environment::URL

class ProcedureList < Test::Unit::TestCase
	def setup
		$driver = Selenium::WebDriver.for :chrome
    	$driver.get(CONST)
    	$wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

	def test_procedureList
		sleep 5
		$driver.find_element(:id, 'Procedures').click
		sleep 5
		procedure_list = $driver.find_element :xpath => '//*[@id="procedure_list"]/div[1]/div/div[2]/ul'
		sleep 5
		element_procedure = procedure_list.find_elements :tag_name => 'li'

		element_procedure.each do |proc|
			proc.click
			sleep 3

		end
		
	end
	begin
		def teardown
    	$driver.quit
    	end
	end
  end