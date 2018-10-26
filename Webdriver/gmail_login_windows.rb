require "selenium-webdriver"

#This demo shows all the methods used to try to get internet explorer
#To clear cache between runs.
#
#
#In the end, I found two:
#On Internet explorer 11, system("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2");
#On Edge, Manually go into settings, clear cache, clear everything, click the clear on every close 'Yes' slider, and quit.

#

#----------------------------------------------------------
# Begin <Capabilities Method, but local>
# Tried this, have not seen success under windows 10, not
# for IE, not for Edge

#caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer;
#caps['ensureCleanSession']=true
#caps['enableElementCacheCleanup']=true
#caps['ie.ensureCleanSession']=true

#driver = Selenium::WebDriver.for :internet_explorer, desired_capabilites:
#driver = Selenium::WebDriver.for :internet_explorer, desired_capabilities: caps

#End <Capabilities Method, but local>
#----------------------------------------------------------
 

driver = Selenium::WebDriver.for :internet_explorer

driver.manage.timeouts.implicit_wait = 15;
driver.manage.timeouts.script_timeout = 15;
driver.manage.timeouts.page_load = 15;

system("RunDll32.exe InetCPl.cpl,ClearMyTracksByProcess 2");

#----------------------------------------------------------
#Microsoft's webdriver can't seem to report cookies, either
#out = driver.manage.all_cookies;
#puts(out);
#
#out.each do |cookie|
# puts(cookie.to_s())
#end
#
#Delete all cookies doesn't seem to work
#driver.manage.delete_all_cookies();
#----------------------------------------------------------

#----------------------------------------------------------
#InPrivate Mode seems to remember where it has been. Sorry.
#----------------------------------------------------------
driver.navigate.to("about:InPrivate");
#----------------------------------------------------------

driver.navigate.to "https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin";

#----------------------------------------------------------
# Here is our actual gmail login script. Change the
# username and password.
#----------------------------------------------------------

element = driver.find_element :css, "input[type='email']"
element.send_keys("username@gmail.com");

nextbtn = driver.find_element :css, "#identifierNext > content > span"
nextbtn.click();

#----------------------------------------------------------
#Using explicit waits under ie/edge. There should probably be 
#A 'clickable' method we could use instead.
#----------------------------------------------------------

sleep(2);
wait = Selenium::WebDriver::Wait.new(:timeout => 15);
wait.until {
         driver.find_element(:css, "input[type='password']").displayed?
}
sleep(6);

passwordinput = driver.find_element :css, "input[type='password']"
passwordinput.send_keys("password");
nextbtn = driver.find_element :css, "#passwordNext > content > span"
nextbtn.click();

puts("Press ENTER to continue ...");
waitforit = gets();

#----------------------------------------------------------
#Edge will force a "are you sure?" screen if we quit here
#So I'll navigate to regular gmail then quit
#----------------------------------------------------------
driver.navigate.to "https://www.google.com";

driver.quit

system("RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2");

driver2 = Selenium::WebDriver.for :internet_explorer
driver2.navigate.to "https://www.google.com";
puts("Press ENTER to continue ...");
waitforit = gets();


exit


