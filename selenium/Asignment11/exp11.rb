require 'selenium-webdriver'

class TableCell

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @driver =Selenium::WebDriver.for :chrome   
    end

    def get_table_header(url ,col_index ,row_index)
        driver.get(url)        
        result = driver.find_element(:tag_name ,"tbody").find_elements(:tag_name ,"tr")[row_index].find_elements(:tag_name , "td")[col_index].text
        return result
    end
end

table_column =3
table_row =2
url = "https://computer-database.gatling.io/computers"

driver_path="selenium/drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =TableCell.new(driver_path)
puts exp1.get_table_header( url , table_column , table_row)


