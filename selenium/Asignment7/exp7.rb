require 'selenium-webdriver'

class DropDown

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome
      
    end

    def perfom_action(url)
        driver.get(url) 
        sleep(1)
        driver.find_element(:css, "select option:nth-child(5)").click
        return driver.find_element(:css, "select option:nth-child(5)").text 
    end   
end



driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =DropDown.new(driver_path)
puts "value=> "+ exp1.perfom_action("https://testpages.herokuapp.com/styled/basic-html-form-test.html").to_s


