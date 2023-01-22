require 'selenium-webdriver'

class TableOpt

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome   
    end

    def get_table_header(url ,col_index)
        driver.get(url) 
        result=[]
        result.push(driver.find_element(:css, "table.computers tr:nth-of-type(1) th:nth-of-type(#{col_index}").text)
        driver.find_elements(xpath: "//table//tr").each_with_index  do |_,index|
            next if index.eql?0
            result.push(driver.find_element(xpath: "//table//tr[#{index}]/td[#{col_index}]").text)  
        end
        return result
    end
end


table_column =2

driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =TableOpt.new(driver_path)
puts exp1.get_table_header("https://computer-database.gatling.io/computers" , table_column)


