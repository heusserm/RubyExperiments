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

   def test_css_focus
      
      #Only tested on mac - finds sample.html in the current working directory
      directory = File.expand_path File.dirname(__FILE__)
      specific_filename = "file://" + directory + "/sample.html"
      @driver.navigate.to specific_filename


     #No element has focus
     found = false
     begin
       element = @driver.find_element :css, 'input:focus'
       found = true
     rescue Selenium::WebDriver::Error::NoSuchElementError
       found = false
      end

      assert_equal(found, false)

     #Sleep is only here so you can watch it run
     #For a real test remove it. Use a tool like 
     #sauce labs to make a movie if you'd like.
     #
     sleep(3)
     
     
     #Now press tab, and an input has focus
     @driver.action.send_keys(:tab).perform

     element = @driver.find_element :css, 'input:focus'
     sleep(3)

     element.send_keys "Hello WebDriver!"
     assert_equal(element.attribute('value'),"Hello WebDriver!")

     sleep(3)
   end

end
