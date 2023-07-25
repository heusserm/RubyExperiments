require 'selenium-webdriver'

# To get this to run
# I needed to add


# Create a Firefox driver object
driver = Selenium::WebDriver.for(:chrome)

# Get the URL of the website you want to visit
url = 'https://www.xndev.com'

# Open the website in the Firefox driver
driver.get(url)

# Get the search button
#search_button = driver.find_element(:xpath,"//a[@class='tb-search-trigger menu-btn']");
search_button = driver.find_element(:css,"a.tb-search-trigger.menu-btn");

# Click on the search button
search_button.click

# Sleep for 5 seconds
sleep(5)

# Quit the Firefox driver
driver.quit

