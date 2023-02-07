require 'test/unit'
require_relative 'WebTesterFramework'
class TestFramework < Test::Unit::TestCase
    
    attr_accessor :url
     
    def test_verify_object_instance
        driver= Driver.new().get_driver
        obj=WebTesterFramework.new(driver)
        assert_equal(true , obj.instance_of?(WebTesterFramework))
        driver.quit()
    end

    def test_launch_url
        driver= Driver.new().get_driver
        obj=WebTesterFramework.new(driver)
        #driver.get("file:///usr/app/src/Demo.html")
        obj.navigate_to("http://127.0.0.1:5500/dockerWorkShop/Workshop/frameWork/Demo.html")
        assert_equal(driver.title ,"test site" )

        driver.quit()
    end

    def test_perform_click
        driver= Driver.new().get_driver
        obj=WebTesterFramework.new(driver)
        #driver.get("file:///usr/app/src/Demo.html")
        driver.get("http://127.0.0.1:5500/dockerWorkShop/Workshop/frameWork/Demo.html")
        drop_down_opt = {:xpath => "//html/body/form/fieldset/p[1]/label/select/option[5]"}
        obj.perform_click(drop_down_opt)
        select_element = driver.find_element(id: 'dropdown')
        select = Selenium::WebDriver::Support::Select.new(select_element)
        option=  select.selected_options
        assert_equal("Dr.", option[0].text)
        driver.quit()
    end
    
    def test_set_text
        driver= Driver.new().get_driver
        obj=WebTesterFramework.new(driver)
        #driver.get("file:///usr/app/src/Demo.html")
        driver.get("http://127.0.0.1:5500/dockerWorkShop/Workshop/frameWork/Demo.html")
        text_field = {:name => 'firstName'}
        obj.set_text(text_field, "user1")
        text_field_txt = driver.find_element(text_field).attribute("value");
        assert_equal("user1", text_field_txt)
        driver.quit()
    end

    def test_send_key
        driver= Driver.new().get_driver
        obj=WebTesterFramework.new(driver)
        #driver.get("file:///usr/app/src/Demo.html")
        driver.get("http://127.0.0.1:5500/dockerWorkShop/Workshop/frameWork/Demo.html")
        original_url = driver.current_url
        text_field = {:name => 'firstName'}
        driver.find_element(text_field).click
        obj.send_key(:enter)
        submit_url =  driver.current_url
        assert_not_equal( original_url , submit_url)
        driver.quit()
    end

    def test_scroll_bottom
        driver= Driver.new().get_driver
        obj=WebTesterFramework.new(driver)
        #driver.get("file:///usr/app/src/Demo.html")
        driver.get("http://127.0.0.1:5500/dockerWorkShop/Workshop/frameWork/Demo.html")
        assert_equal(true ,obj.scroll_window_bottom() )
        driver.quit()
    end


    def test_scroll_loop
        driver= Driver.new().get_driver
        obj=WebTesterFramework.new(driver)
        #driver.get("file:///usr/app/src/Demo.html")s
        driver.get("http://127.0.0.1:5500/dockerWorkShop/Workshop/frameWork/Demo.html")
        assert_equal(true ,obj.scroll_window(5 , 5 , 0.5) )
        driver.quit()
    end

    def test_max_window
        driver= Driver.new().get_driver
        obj=WebTesterFramework.new(driver)
        #driver.get("file:///usr/app/src/Demo.html")
        driver.get("http://127.0.0.1:5500/dockerWorkShop/Workshop/frameWork/Demo.html")  
        assert_equal(true , obj.maximize_window )
        driver.quit()
    end

    def test_quit
        driver= Driver.new().get_driver
        obj=WebTesterFramework.new(driver)
        #driver.get("file:///usr/app/src/Demo.html"))
        driver.get("http://127.0.0.1:5500/dockerWorkShop/Workshop/frameWork/Demo.html")
        obj.quit
        assert_equal(true, obj.driver.nil? )
    end
end