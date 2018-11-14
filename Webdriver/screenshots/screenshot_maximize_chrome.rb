require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new
#options.add_argument('--ignore-certificate-errors')
#options.add_argument('--disable-popup-blocking')
#options.add_argument('--disable-translate')
options.add_argument('--start-maximized')

driver = Selenium::WebDriver.for :chrome, options: options

#only tested on mac - finds sample.html in the current working directory
directory = File.expand_path File.dirname(__FILE__)
specific_filename = "file://" + directory + "/sample.html"
driver.navigate.to specific_filename


target_size = Selenium::WebDriver::Dimension.new(1440, 1800)
driver.manage.window.size = target_size

puts("Press ENTER to continue ...");
waitforit = gets();

driver.save_screenshot("screenshot_orig.png");


puts driver.title

driver.quit
