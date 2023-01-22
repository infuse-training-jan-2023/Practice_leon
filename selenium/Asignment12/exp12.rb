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
        driver.find_element(:css, "span.menu-icon-hamb").click
        sleep(1)
         driver.find_element(:css, "ul#navigation-1 li:nth-child(7) ").click

        searchBar=driver.find_element(:id, "search")

        searchBar.send_keys("gaming monitors 27 inch")

        searchBar.send_key(:enter)
        sleep(2)

     
        product1= driver.find_element(:id, "245657")

        original_window = driver.window_handle
        product1.find_element(:css ,"a").click
        wait.until { driver.window_handles.length == 2 }
        driver.window_handles.each do |handle|
            if handle != original_window
                driver.switch_to.window handle
                break
            end
        end
        sleep(3)
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")

        driver.close

        driver.switch_to.window original_window

        offset =0
        for a in 1..7 do
            offset=offset+500
            driver.execute_script("window.scrollTo(0, #{offset})")
            sleep(0.5)
        end
        driver.quit
    end   
end



driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =DropDown.new(driver_path)
exp1.perfom_action("https://www.croma.com/")



