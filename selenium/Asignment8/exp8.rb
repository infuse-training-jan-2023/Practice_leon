require 'selenium-webdriver'

class Slider

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome
      
    end

    def perfom_action(url)
        driver.get(url) 
        sleep(1)
        iframe= driver.find_element(:css,'iframe.lazyloaded')
        driver.switch_to.frame(iframe)   
        seek=driver.find_element(:tag_name , 'span' )
        driver.action.drag_and_drop_by(seek, 400, 165 ).perform
        puts "clicked seek and moved button"  
        sleep(3)   
    end   
end

driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =Slider.new(driver_path)
exp1.perfom_action("https://www.globalsqa.com/demo-site/sliders/#Steps")


