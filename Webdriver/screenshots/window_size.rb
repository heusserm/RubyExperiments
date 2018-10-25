require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')
options.add_argument('--window-size=900,900')


driver = Selenium::WebDriver.for :chrome, options: options

#only tested on mac - finds sample.html in the current working directory
directory = File.expand_path File.dirname(__FILE__)
specific_filename = "file://" + directory + "/sample.html"
driver.navigate.to specific_filename

#Sleep is for educational purposes only
puts("Press ENTER to continue ...");
waitforit = gets();

driver.save_screenshot("screenshot_orig.png");

#Now we'll resize the window
driver.manage.window.resize_to(800, 600);

#width  = driver.execute_script("return Math.max(document.body.scrollWidth, document.body.offsetWidth, document.documentElement.clientWidth, document.documentElement.scrollWidth, document.documentElement.offsetWidth);")
#height = driver.execute_script("return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);")
#driver.manage.window.resize_to([width+100, 2048].min, [height+100, 768].min) #Restrict to maximum of 1500 x 3000
driver.save_screenshot("screenshot_resized.png");

#And pause again
puts("Press ENTER to continue ...");
waitforit = gets();



puts driver.title

driver.quit
