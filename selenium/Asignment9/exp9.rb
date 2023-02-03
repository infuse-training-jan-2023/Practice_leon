require 'selenium-webdriver'

class Table

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @driver =Selenium::WebDriver.for :chrome  
    end

    def perfom_action(url)
        driver.get(url) 
        sleep(1)
        result=  driver.find_element(:tag_name, "tr").text
        sleep(2)  
        puts result
        return 
    end   
end

url = "https://cosmocode.io/automation-practice-webtable/"

driver_path="selenium/drivers/chromedriver_win32/chromedriver.exe"
exp1 =Table.new(driver_path)
exp1.perfom_action(url)


