require_relative "WebTesterFramework"


class Sokoglam

    attr_accessor :test

    def initialize()
        #driver_path="frameWork\\drivers\\chromedriver_win32\\chromedriver.exe"
        driver_path="/opt/chromedriver-109.0.5414.74/chromedriver"
        @test = WebTesterFramework.new("Chrome",driver_path)
    end

    def launch_url()
        url ="https://sokoglam.com/"
        test.navigate_to(url)
        test.maximize_window
        puts "launched url"
    end

    def sign_in()
        login_button_xpath ={:xpath =>'//*[@id="shopify-section-site-nav"]/nav/div/div[3]/a[1]' }
        username_text_field ={:id => "UserEmail"}
        username="user1@gmail.com"
        password_text_field ={:id => "UserLogin"}
        pass="1234"
        submit_btn ={:css => "input[value='Login']"}

        test.perform_click(login_button_xpath)
        sleep(3)
        test.set_text(username_text_field , username)
        test.set_text(password_text_field, pass)
        test.perform_click(submit_btn)
        sleep(10)
        puts "done with sign in"
        if test.is_displayed({:id => "ltkpopup-content"})
            test.perform_click({:xpath => '//*[@id="ltkpopup-close-button"]/a'})
        end


    end

    def search_item()
        search_icon ={:xpath => '//*[@id="shopify-section-site-nav"]/nav/div/div[3]/div[1]/img'}
        searchBar ={:id => "search-value"}
        search_text = "youthforia"

        test.perform_click(search_icon)
        sleep(1)
        test.set_text(searchBar , search_text)
        test.send_key(:enter)

        puts "search item"
    end

    def add_to_wishlist( wish_list_xpath)    
        test.perform_click(wish_list_xpath)
        sleep(3)

        puts "add to wish list"
    end

    def scroll(offset , iter , delay)
        test.scroll_window(offset , iter , delay)
        puts "scroll fun"
    end


    def select_nav_tab(tab)
        test.perform_click(tab)
        puts "seclect tab"
    end


    def adjust_slider()
        right_slider={:xpath =>"//*[@id='slider-range']/span[2]"}
        test.drag_and_drop(right_slider , -100 , 230)
        sleep(2)
        puts "adjust slider"
    end


    def view_product(element)
        test.perform_click(element)
        sleep(3)
        puts " view product"
    end


    def add_to_cart()
        test.perform_click({:id =>"AddToCartText"})
        sleep(5)
        test.perform_click({:xpath =>'/html/body/section[1]/ul/li/div[2]/a[2]'})
        sleep(2)
        test.perform_click({:xpath=>'/html/body/section[1]/div/div/button'})

        puts "add to cart"
    end

    def exit 
        test.quit
        puts "exit"
    end
    
end

deals_tab={:xpath=>"//*[@id='shopify-section-site-nav']/nav/div/ul/div/li[3]/a"}

wish_list_tab={:xpath=>"//*[@id='shopify-section-site-nav']/nav/div/div[3]/a[2]"}

bag_tab={:xpath=>'//*[@id="shopify-section-site-nav"]/nav/div/div[3]/div[2]'}

product1={:xpath => '//*[@id="body_main"]/div[2]/div/div[1]/div[1]/div[1]/div/a'}



sokoglam = Sokoglam.new

sokoglam.launch_url()

sokoglam.sign_in()

sokoglam.search_item()

sokoglam.add_to_wishlist(product1)

sokoglam.scroll(200 , 2 , 0.5)

sokoglam.add_to_wishlist({:xpath => '//*[@id="body_main"]/div[2]/div/div[5]/div[1]/div[1]/div/a'})

sokoglam.select_nav_tab(deals_tab)

sokoglam.scroll(200 , 7 , 0.2)

sokoglam.adjust_slider

sokoglam.view_product({:xpath => '//*[@id="ImageWrapper-31919790161989-0"]'})

sokoglam.add_to_cart()

sokoglam.select_nav_tab(deals_tab)

sokoglam.exit

