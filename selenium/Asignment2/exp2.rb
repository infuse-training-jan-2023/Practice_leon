require 'selenium-webdriver'

class PageTitle

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @driver =Selenium::WebDriver.for :chrome
    end

    def open_url(url)
        driver.get(url) 
        puts driver.title
        sleep(5)       
    end
end

url="https://www.reliancedigital.in/"

driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =PageTitle.new(driver_path)
exp1.open_url(url)


