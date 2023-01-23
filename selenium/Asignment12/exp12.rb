require 'selenium-webdriver'

class CromaWebTester

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome
      
    end

    def openWebsite(url)
        driver.get(url) 
    end

    def open_dropdown
        driver.find_element(:css, "span.menu-icon-hamb").click
    end

    def selectDropDownItem(index)
        driver.find_element(:css, "ul#navigation-1 li:nth-child(#{index}) ").click
    end

    def useSearchBar(text)
        searchBar=driver.find_element(:id, "search")
        searchBar.send_keys(text)
        searchBar.send_key(:enter)
        sleep(2)
    end

    def selectProduct(id)
        product1= driver.find_element(:id, id)
        original_window = driver.window_handle
        sleep(2)
        product1.find_element(:css ,'a').click
        wait.until { driver.window_handles.length == 2 }
        driver.window_handles.each do |handle|
            if handle != original_window
                driver.switch_to.window handle
                break
            end
        end
        sleep(3)
        scrollWindowBottom()
        sleep(3)
        driver.close
        driver.switch_to.window original_window
    end

    def scrollWindowBottom()
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
    end

    def scrollWindow(offset ,loopCount , delay)
        counter=0
        for a in 1..loopCount do
            counter=counter+offset
            driver.execute_script("window.scrollTo(0, #{counter})")
            sleep(delay)
        end
    end

    def quit()
        driver.quit
    end 
end

driver_path="drivers\\chromedriver_win32\\chromedriver.exe"
exp1 =CromaWebTester.new(driver_path)

exp1.openWebsite("https://www.croma.com/")
exp1.open_dropdown
exp1.selectDropDownItem(7)
exp1.useSearchBar("gaming monitors 27 inch")
exp1.selectProduct("245657")
exp1.scrollWindow(500 ,7 , 0.5)
exp1.quit



