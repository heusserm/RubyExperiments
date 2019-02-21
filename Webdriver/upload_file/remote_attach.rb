require 'rubygems'
require "test/unit"
require 'selenium-webdriver'
class ExampleTest < Test::Unit::TestCase
 def setup
    caps = Selenium::WebDriver::Remote::Capabilities.chrome()
    caps['platform'] = 'Windows 10'
    caps['version'] = '72.0'
    caps[:name] = "Remote File Upload using Selenium 3 with Ruby"
    caps['selenium-version'] = "3.14.0"
    @driver = Selenium::WebDriver.for(
      :remote,
      :url => "http://USERNAME:ACCESS_KEY@ondemand.saucelabs.com:80/wd/hub",
      :desired_capabilities => caps)
    @driver.file_detector = lambda do |args|
       # args => ["/path/to/file"]
       str = args.first.to_s    
       str if File.exist?(str)
    end
 end

 def test_sauce
    @driver.navigate.to "http://xndev.com/display-image/"
    element = @driver.find_element(:xpath, "//*[@id='post-2122']/div/input")
    directory = File.expand_path File.dirname(__FILE__)

    #Note for windows the slash will need to be switched"
    #file://
    specific_filename = directory + "/" + "broken_bulb.jpg" 
    element.send_keys specific_filename

    object = @driver.find_element(:xpath, "//img['data:image/jpeg;base64'=substring(@src,1,22)]")

    assert true    
 end

def teardown
    @driver.quit
end

end

