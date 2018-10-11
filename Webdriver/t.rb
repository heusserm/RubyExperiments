require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')

driver = Selenium::WebDriver.for :chrome, options: options

driver.navigate.to "http://google.com"

element = driver.find_element :xpath, '//input[@name="q"]'
#element = driver.find_element :css, 'input[name=q]'

puts(element.class)

element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit
