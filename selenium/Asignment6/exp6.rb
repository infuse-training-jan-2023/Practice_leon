require 'selenium-webdriver'

class DropDown

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @driver =Selenium::WebDriver.for :chrome    
    end

    def perfom_action(url)
        select_element={:tag_name =>"select"}
        driver.get(url) 
        sleep(1)
        results=[]
        select_element = driver.find_elements(select_element)
        select = Selenium::WebDriver::Support::Select.new(select_element[0])
        option_list = select.options
        option_list.each { |option| 
            results.push(option.text)    
        }
       return results
    end
end

url="https://letcode.in/forms"

driver_path="selenium/drivers/chromedriver_win32/chromedriver.exe"
exp1 =DropDown.new(driver_path)
puts exp1.perfom_action(url)


