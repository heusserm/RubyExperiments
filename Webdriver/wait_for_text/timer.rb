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

   #Adapted with permission from other Sauce Labs Examples
   def contains_with_timeout(driver, expected, timeout=60)
    start = Time.now();
    found = false;
    puts start.to_s();
    puts Time.now().to_s();
    
    while (Time.now()-start<timeout) and not found
        if body_contains(driver, expected)
            found = true;
        else 
          sleep(0.25);
        end
    end
    return found;
   end

   def body_contains(driver,expected_content)
     source = driver.page_source;
     puts "expected ( " +  expected_content + " ) \n\n";
     puts "source ( " +  source + " ) \n\n";
     puts (source.include? expected_content).to_s();
     return source.include? expected_content;
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

     contains_with_timeout(@driver,"Sauce Labs");

     element = @driver.find_element :xpath, "//a[text() = 'Sauce Labs']"
     assert_equal('https://www.saucelabs.com/', element.attribute('href'));
     
   end

end
