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
        sleep(1)
        driver.find_element(:name, "q").click
        puts "clicked search box"
        driver.find_element(:name, "q").send_keys("amd ryzen 7000 series")
        driver.find_element(:name, "q").send_key(:enter)
        puts "clicked radio button"
        sleep(2)   
    end
end



driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =Click_element.new(driver_path)
exp1.perfom_action("https://www.google.com")


