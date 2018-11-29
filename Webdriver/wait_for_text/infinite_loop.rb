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

     #Our first XPATH example. BOO ...
     element = @driver.find_element :xpath, "//h2[text() = 'Sample Text']"
     assert_equal("Sample Text", element.attribute('innerText'))

     #Our second example, which is CSS. YAY ...
     element = @driver.find_element :css, "h2[ID='First']"
     assert_equal("Sample Text", element.attribute('innerText'))

     #And now we'll do the text for the HREF to appear
     page_source = @driver.page_source
     includes_sauce = page_source.include? "Sauce Labs";
     while not (includes_sauce)
       sleep(0.01);
       page_source = @driver.page_source;
       includes_sauce = page_source.include? "Sauce Labs";
     end


     element = @driver.find_element :xpath, "//a[text() = 'Sauce Labs']"
     assert_equal('https://www.saucelabs.com/', element.attribute('href'));
     
   end

end
