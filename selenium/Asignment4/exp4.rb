require 'selenium-webdriver'

class Click_element

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @driver =Selenium::WebDriver.for :chrome
    end

    def perfom_action(url)
        driver.get(url) 
        sleep(1)
        driver.find_element(:id, "checkbox2").click
        driver.find_element(:css, "input[value='FeMale']").click
        sleep(1)   
    end
end

url="https://demo.automationtesting.in/Register.html"

driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =Click_element.new(driver_path)
exp1.perfom_action(url)


