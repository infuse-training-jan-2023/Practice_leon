require 'selenium-webdriver'

class TableCell

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome   
    end

    def get_table_header(url ,col_index ,row_index)
        driver.get(url) 
        result=[]
        result.push(driver.find_element(xpath: "//table//tr[#{row_index}]/td[#{col_index}]").text)  
        return result
    end
end


table_column =4
table_row =3

driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =TableCell.new(driver_path)
puts exp1.get_table_header("https://computer-database.gatling.io/computers" , table_column , table_row)


