require 'test/unit'
require_relative 'WebTesterFramework.rb'
class UnitTestDemo < Test::Unit::TestCase
    
    attr_accessor :driver_path ,:obj , :url
     
    @driver_path="/opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver"
    url="File:///src/Demo.html"


    def test_verifyObjectInstance
        obj=WebTesterFramework.new("Chrome" ,driver_path)
        assert_equal(true , obj.instance_of?(WebTesterFramework))
        obj.quit()
    end

    def test_launch_url
        obj=WebTesterFramework.new("Chrome" ,driver_path)
        assert_equal(true , obj.navigate_to(url))
        obj.quit()
    end

    def test_perform_click
        obj=WebTesterFramework.new("Chrome" ,driver_path)
        obj.navigate_to(url)
        assert_equal(true ,obj.perform_click({:xpath => '/html/body/form/fieldset/p[1]/label/select/option[5]'}) )
        obj.quit()
    end

    def test_set_text
        obj=WebTesterFramework.new("Chrome" ,driver_path)
        obj.navigate_to(url)
        assert_equal(true ,obj.set_text({:xpath => '/html/body/form/fieldset/p[2]/label/input'}, "user1") )
        obj.quit()
    end

    def test_send_key
        obj=WebTesterFramework.new("Chrome" ,driver_path)
        obj.navigate_to(url)
        assert_equal(true ,obj.send_key(:down) )
        obj.quit()
    end

    def test_scroll_bottom
        obj=WebTesterFramework.new("Chrome" ,driver_path)
        obj.navigate_to(url)
        assert_equal(true ,obj.scroll_window_bottom() )
        obj.quit()
    end


    def test_scroll_loop
        obj=WebTesterFramework.new("Chrome" ,driver_path)
        obj.navigate_to(url)
        assert_equal(true ,obj.scroll_window(5 , 5 , 0.5) )
        obj.quit()
    end

    def test_max_window
        obj=WebTesterFramework.new("Chrome" ,driver_path)
        obj.navigate_to(url)
        assert_equal(true ,obj.maximize_window )
        obj.quit()
    end

    def test_quit
        obj=WebTesterFramework.new("Chrome" ,driver_path)
        obj.navigate_to('http://127.0.0.1:5500/frameWork/Demo.html')
        assert_equal(true ,obj.quit )
    end

end