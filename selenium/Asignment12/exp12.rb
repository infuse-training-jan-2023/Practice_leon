require 'selenium-webdriver'

class CromaWebTester

    attr_accessor :driver , :wait

    def initialize(driver_path)
        Selenium::WebDriver::Chrome::Service.driver_path = driver_path
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
        @driver =Selenium::WebDriver.for :chrome
    end

    def open_website(url)
        driver.get(url) 
    end

    def open_dropdown
        drop_down = {:css => "span.menu-icon-hamb"}
        driver.find_element(drop_down).click
    end

    def select_drop_down_item(index)
        select_option = {:css =>"ul#navigation-1 li:nth-child(#{index}) "}
        driver.find_element(select_option).click
    end

    def use_search_bar(text)
        search_bar_element = {:id => "search"}
        search_bar=driver.find_element(search_bar_element)
        search_bar.send_keys(text)
        search_bar.send_key(:enter)
        sleep(2)
    end

    def select_product(id)
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
        scroll_window_bottom()
        sleep(3)
        driver.close
        driver.switch_to.window original_window
    end

    def scroll_window_bottom()
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
    end

    def scroll_window(offset ,loopCount , delay)
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

driver_path="selenium/drivers/chromedriver_win32/chromedriver.exe"
exp1 =CromaWebTester.new(driver_path)

url = "https://www.croma.com/"

exp1.open_website(url)
exp1.open_dropdown
exp1.select_drop_down_item(7)
exp1.use_search_bar("gaming monitors 27 inch")
exp1.select_product("245657")
exp1.scroll_window(500 ,7 , 0.5)
exp1.quit



