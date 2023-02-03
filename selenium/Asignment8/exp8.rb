require 'selenium-webdriver'

class Slider

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @driver =Selenium::WebDriver.for :chrome
    end

    def perfom_action(url , move_steps)
        slider_seek = {:tag_name => 'span' }
        driver.get(url) 
        sleep(1)
        iframe= driver.find_element(:css,'iframe.lazyloaded')
        driver.switch_to.frame(iframe)   
        seek=driver.find_element(slider_seek)
        for i in 1..move_steps
            seek.send_key(:arrow_up)
        end
        puts seek.attribute("style")
        sleep(3)   
    end   
end

url = "https://www.globalsqa.com/demo-site/sliders/#Steps"
move_steps = 5

driver_path="selenium/drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =Slider.new(driver_path)
exp1.perfom_action(url ,move_steps)


