require "selenium-webdriver"
require 'test/unit'


class SampleTest < Test::Unit::TestCase 

    def setup
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--ignore-certificate-errors')
      options.add_argument('--disable-popup-blocking')
      options.add_argument('--disable-translate')
      @driver = Selenium::WebDriver.for :chrome, options: options
   end

   def teardown
      @driver.quit
   end


   def test_css_explicit_wait
      
      #Only tested on mac - finds sample.html in the current working directory
      directory = File.expand_path File.dirname(__FILE__)
      specific_filename = "file://" + directory + "/sample.html"
      @driver.navigate.to specific_filename


     #And now we'll do the text for the HREF to appear
     wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
     element = nil;
     begin
           element = wait.until { @driver.find_element(:id => "truth") }
     ensure

     end
     assert_equal('https://www.saucelabs.com/', element.attribute('href'));
     
   end

end
