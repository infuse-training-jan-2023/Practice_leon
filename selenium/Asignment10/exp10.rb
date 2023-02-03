require 'selenium-webdriver'

class Table

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome   
    end

    def get_table_header(url ,col_index)
        driver.get(url) 
        result=[]
        result.push(driver.find_element(:tag_name, "thead").find_elements(:tag_name ,"th" )[col_index-1].text)
        rows = driver.find_elements(:tag_name , "tr")
        rows.each_with_index  do |_,index|
            next if index.eql?0
            result.push(driver.find_element(xpath: "//table//tr[#{index}]/td[#{col_index}]").text)  
        end
        return result
    end
end

table_column =2
url = "https://computer-database.gatling.io/computers"

driver_path="selenium/drivers/chromedriver_win32/chromedriver.exe"
exp1 =Table.new(driver_path)
puts exp1.get_table_header( url , table_column)


