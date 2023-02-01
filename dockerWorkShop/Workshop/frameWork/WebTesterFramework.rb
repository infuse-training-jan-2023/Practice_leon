require 'selenium-webdriver'

class WebTesterFramework

    attr_accessor :driver , :wait

    def initialize(browser,driver_path)
        begin
            if  browser.eql?("Chrome") 
                 Selenium::WebDriver::Chrome::Service.driver_path = "/opt/chromedriver-109.0.5414.74/chromedriver"
                #Selenium::WebDriver::Chrome::Service.driver_path = "frameWork\\drivers\\chromedriver_win32\\chromedriver.exe"

                options = Selenium::WebDriver::Chrome::Options.new
                # options.add_argument('--ignore-certificate-errors')
                # options.add_argument('--disable-popup-blocking')
                # options.add_argument('--disable-translate')
                options.add_argument('--headless')
                options.add_argument('--disable-gpu')
                options.add_argument('--no-sandbox')
                options.add_argument("--window-size=1920,1080")
                options.add_argument("--disable-dev-shm-usage")
        
                @driver = Selenium::WebDriver.for :chrome, options: options

                return driver
                
            elsif browser.eql?("Edge")
                Selenium::WebDriver::Edge::Service.driver_path = driver_path
                elsif browser.eql?("Firefox")
                    Selenium::WebDriver::Firefox::Service.driver_path = driver_path
            end

        rescue => exception
            puts exception
        end
        
        @wait = Selenium::WebDriver::Wait.new(:timeout=>10)
       # @driver =Selenium::WebDriver.for :chrome
    end


    def navigate_to(url)
        begin
            driver.get(url)
           # puts "site navigated"
            return true
        rescue => exception
            puts exception
            return false
        end  
    end
 
    def perform_click(element)
        begin
            driver.find_element(element).click
            return true
        rescue => exception
            puts exception
            return false
        end     
    end


    def set_text(search_element , text) 
        begin
            driver.find_element(search_element).send_keys(text)
            return true
        rescue => exception
            puts exception
            return false
        end
    end

    def send_key(key)
        begin
            driver.action.send_keys(key).perform
            return true
        rescue => exception
            puts exception
            return false
        end
    end

    def drag_and_drop(element , x , y)
        begin
            seek=driver.find_element(element)
           
            driver.action.drag_and_drop_by(seek, x, y ).perform
            return true
        rescue => exception
            puts exception
            return false
        end
    end

    def scroll_window_bottom()
        begin
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
            return true
        rescue => exception
            puts exception
            return false
        end
    end

    def scroll_window(offset ,loopCount , delay)
        begin
            counter=0
            for a in 1..loopCount do
                counter=counter+offset
                driver.execute_script("window.scrollTo(0, #{counter})")
                sleep(delay)
            end
            return true
        rescue => exception
            puts exception
            return false
        end
    end

    def quit()
        begin
            driver.quit
            return true
        rescue => exception
            puts exception
            return false
        end
    end 

    def maximize_window()
        begin
            driver.manage.window.maximize
            return true
        rescue => exception
            puts exception
            return false
        end
    end

    def getDriver()
        return driver
    end

    def is_displayed(element)
        return driver.find_element(element).displayed?
    end
end




