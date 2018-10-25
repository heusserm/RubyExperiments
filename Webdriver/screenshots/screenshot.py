
#screenshot.py
#By Matt Heusser Matt@xndev.com
#Demonstrates how to take a screenshot in python
#Tested in Mac/Chrome

#Mac OS Sierra (10.12.6) includes 2.7.1. As of Oct 25, 2019, that works with the current version
#of selenium. To run selenium webdriver 3.14, you'll need to install pip, the python installer,
#then pip install selenium, then download and install a browser-driver, in this example 
#chromedriver, and place it in the operating system's path. To get the 
#
#sudo sudo curl https://bootstrap.pypa.io/get-pip.py | sudo python
#
#pip install selenium
#
#To get the path, type "echo $PATH" froom the command line. (We are using /opt/local/bin/)
#Then download chromedriver (using 2.34 in this example):
#
# http://chromedriver.chromium.org/downloads
#
#The exact version of everything documented here will work on Chrome/Mac OS.
#

#
#
import time
from selenium import webdriver
import os

driver = webdriver.Chrome();  # Optional argument, if not specified will search path.

directory = os.path.dirname(os.path.realpath(__file__));
specific_filename = "file://" + directory + "/sample.html";
driver.get(specific_filename);

#Sleep is for educational purposes only
driver.save_screenshot("screenshot_python.png");
waitforit = raw_input("Press ENTER to continue ...");
driver.quit()
