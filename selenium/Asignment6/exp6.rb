require 'selenium-webdriver'

class DropDown

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome    
    end

    def perfom_action(url)
        driver.get(url) 
        sleep(1)
        results=[]
        selectElement =driver.find_elements(:xpath ,"/html/body/app-root/app-forms/section[1]/div/div/div[1]/div/div/form/div[2]/div[2]/div/div/div/select")
        options =  selectElement[0].find_elements(:css , 'option')
        options.each { |option| 
            results.push(option.text)    
        }

       return results
       
    end
end

driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =DropDown.new(driver_path)
puts exp1.perfom_action("https://letcode.in/forms")


