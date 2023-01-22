require 'selenium-webdriver'

class Get_title

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome
      
    end

    def open_url(url)
        driver.get(url) 
        puts driver.title
        sleep(5)       
    end
end



driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =Get_title.new(driver_path)
exp1.open_url("https://www.reliancedigital.in/")


