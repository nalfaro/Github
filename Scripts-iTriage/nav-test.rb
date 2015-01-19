require 'rubygems'
require 'selenium-webdriver'
require "test/unit"


CONST = "https://www.itriagehealth.com"

class ProcedureList < Test::Unit::TestCase
	def setup
		$driver = Selenium::WebDriver.for :chrome
    	$driver.get(CONST)
    	$wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

	def test_procedureList
		$wait.until {$driver.find_element(:id, 'Procedures')}
		$driver.find_element(:id, 'Procedures').click
		$wait.until {procedure_list = $driver.find_element(:xpath, '//*[@id="procedure_list"]/div[1]/div/div[2]/ul')}
		#$Wait
		last_prod.find_element(:xpath, "//div[@class='content']").location_once_scrolled_into_view
		last_prod = $driver.find_element(:css, '#procedure_list > div.wrapper > div > div.content > ul > li:nth-child(590)')
		 sleep 5

=begin		procedure_list = $wait.until {
			element = $driver.find_element(:xpath, '//*[@id="procedure_list"]/div[1]/div/div[2]/ul')
			element if element.displayed?
		}
		
		element_procedure = procedure_list.find_elements :tag_name => 'li'

		element_procedure.each do |proc|
			proc.click
			sleep 3
		end
=end		
	end

=begin	
	begin
		def teardown
    	$driver.quit
    	end
	end
=end
  end