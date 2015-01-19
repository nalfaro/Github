require "rubygems"
require "selenium-webdriver"

$driver = Selenium::WebDriver.for :firefox
$driver.navigate.to "https://www.itriagehealth.com/procedures"

56.times do
  $driver.find_element(:xpath, "//div[@class='content']").send_keys :page_down
  #sleep 1
end
