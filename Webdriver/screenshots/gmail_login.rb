require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')


driver = Selenium::WebDriver.for :chrome, options: options
driver.manage.timeouts.implicit_wait = 5;

#only tested on mac - finds sample.html in the current working directory
driver.navigate.to "https://www.gmail.com";

element = driver.find_element :css, "input[type='email']"
element.send_keys("emailaddress@gmail.com");

nextbtn = driver.find_element :css, "#identifierNext > content > span"
nextbtn.click();

wait = Selenium::WebDriver::Wait.new(:timeout => 15);
wait.until {
         driver.find_element(:css, "input[type='password']").displayed?
}


passwordinput = driver.find_element :css, "input[type='password']"
passwordinput.send_keys("password");
nextbtn = driver.find_element :css, "#passwordNext > content > span"
nextbtn.click();

puts("Press ENTER to continue ...");
waitforit = gets();

#driver.save_screenshot("screenshot_orig.png");
#
driver.quit

driver2 = Selenium::WebDriver.for :chrome, options: options
driver2.navigate.to "https://www.google.com";
puts("Press ENTER to continue ...");
waitforit = gets();


puts driver.title

driver.quit
