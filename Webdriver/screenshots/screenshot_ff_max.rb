require "selenium-webdriver"


driver = Selenium::WebDriver.for :firefox

#only tested on mac - finds sample.html in the current working directory
directory = File.expand_path File.dirname(__FILE__)
specific_filename = "file://" + directory + "/sample.html"
driver.navigate.to specific_filename

driver.manage.window.maximize

driver.save_screenshot("screenshot_orig.png");


puts driver.title

driver.quit
