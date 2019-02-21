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

   def test_click_button
      
      #Only tested on mac - finds sample.html in the current working directory
      directory = File.expand_path File.dirname(__FILE__)
      specific_filename = "file://" + directory + "/sample.html"
      @driver.navigate.to specific_filename


      for i in 1..10 do
           id = "submitter"+i.to_s();
           css = "input[id='" + id + "']";
           puts "clicking " +  id;
           element =  @driver.find_element :css, css;
           element.click()
           sleep(1);
      end

     #If we get this far we are okay
     assert(true);
   end

end
