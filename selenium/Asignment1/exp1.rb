require 'selenium-webdriver'

class Maximize_window 

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @driver =Selenium::WebDriver.for :chrome
      
    end

    def open_url(url)
         driver.get(url) 
         driver.manage.window.maximize
         sleep(5)       
    end
end


url="https://www.reliancedigital.in/"

driver_path="selenium/drivers/chromedriver_win32/chromedriver.exe"  
exp1 =Maximize_window.new(driver_path)
exp1.open_url(url)


