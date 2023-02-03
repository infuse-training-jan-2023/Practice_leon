require 'selenium-webdriver'

class ClickElement

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @driver =Selenium::WebDriver.for :chrome
    end

    def perfom_action(url)
        search_bar={:name =>"q"}
        search_text="amd ryzen 7000 series"
        driver.get(url) 
        sleep(1)
        driver.find_element(search_bar).click
        driver.find_element(search_bar).send_keys(search_text)
        driver.find_element(search_bar).send_key(:enter)
        sleep(2)   
    end
end

url="https://www.google.com"

driver_path="selenium\\drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =ClickElement.new(driver_path)
exp1.perfom_action(url)


