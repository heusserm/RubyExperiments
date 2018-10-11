require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')

#Only tested on mac
directory = File.expand_path File.dirname(__FILE__)
specific_filename = "file://" + directory + "/sample.html"

driver = Selenium::WebDriver.for :chrome, options: options



#Change this to your location on your harddrive
driver.navigate.to specific_filename
sleep(10)

element = driver.find_element :css, 'div:contains("Click here")'


puts driver.title

driver.quit
