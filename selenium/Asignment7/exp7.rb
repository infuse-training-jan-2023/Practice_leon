require 'selenium-webdriver'

class DropDown

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @driver =Selenium::WebDriver.for :chrome
    end

    def perfom_action(url)
        drop_down_element ={:name => "dropdown"}
        driver.get(url) 
        sleep(1)
        select_element = driver.find_element(drop_down_element)
        select = Selenium::WebDriver::Support::Select.new(select_element)
        select.select_by(:index,3)
        return select.selected_options[0].text
    end   
end

url="https://testpages.herokuapp.com/styled/basic-html-form-test.html"

driver_path="selenium/drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =DropDown.new(driver_path)
puts "value=> "+ exp1.perfom_action(url)


