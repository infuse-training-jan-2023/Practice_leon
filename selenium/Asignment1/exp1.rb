require 'selenium-webdriver'

class Maximize_window 

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome
      
    end

    def open_url(url)
         driver.get(url) 
         wait.until{driver.manage.window.maximize}
         sleep(5)       
    end
end



driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =Maximize_window.new(driver_path)
exp1.open_url("https://www.reliancedigital.in/")


