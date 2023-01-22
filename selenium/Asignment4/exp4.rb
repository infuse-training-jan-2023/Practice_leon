require 'selenium-webdriver'

class Click_element

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome
      
    end

    def perfom_action(url)
        driver.get(url) 
        # wait.until{driver.manage.window.maximize}
        sleep(1)
        driver.find_element(:id, "checkbox2").click
        puts "clicked check box"
        puts driver.find_element(:css, "input[value='FeMale']").click
        puts "clicked radio button"  
        sleep(1)   
    end
end



driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =Click_element.new(driver_path)
exp1.perfom_action("https://demo.automationtesting.in/Register.html")


