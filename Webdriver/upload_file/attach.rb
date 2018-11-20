require "selenium-webdriver"


options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')



#driver = Selenium::WebDriver.for :firefox

driver = Selenium::WebDriver.for :chrome, options: options

#only tested on mac - finds sample.html in the current working directory
directory = File.expand_path File.dirname(__FILE__)
specific_filename = "file://" + directory + "/sample.html"
driver.navigate.to specific_filename

wd = Dir.pwd;
fullpathtofile = wd + "/menunewsroom.gif";


system("curl -o menunewsroom.gif http://www.dolekemp96.org/menunewsroom.gif");

#These waits are only put in so the user can watch what is happening
#-------------------------------------------------------------------
puts("Press ENTER to continue ...");
waitforit = gets();

element = driver.find_element(:name, "file_upload")

element.send_keys(fullpathtofile);

puts element.attribute("value");

#These waits are only put in so the user can watch what is happening
##-------------------------------------------------------------------
puts("Press ENTER to continue ...");
waitforit = gets();

puts driver.title

driver.quit
