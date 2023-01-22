require 'selenium-webdriver'

class Table

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome
      
    end

    def perfom_action(url)
        driver.get(url) 
        sleep(1)
        result=  driver.find_element(:css, "table#countries tr:first-child").text
        sleep(2)  
        return result
    end   
end

driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =Table.new(driver_path)
puts "headers =>  " +exp1.perfom_action("https://cosmocode.io/automation-practice-webtable/")


