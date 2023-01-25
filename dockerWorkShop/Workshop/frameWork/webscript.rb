require_relative "WebTesterFramework"



driver_path="frameWork\\drivers\\chromedriver_win32\\chromedriver.exe"

url ="https://sokoglam.com/"

login_button_xpath ={:xpath =>'//*[@id="shopify-section-site-nav"]/nav/div/div[3]/a[1]' }

wish_list_xpath ={:xpath => '//*[@id="shopify-section-site-nav"]/nav/div/div[3]/a[2]'}

search_icon ={:class => "global-header__right--search"}

searchBar ={:id => "search-value"}

search_text = "youthforia"

username_text_field ={:id => "UserEmail"}
username="user1@gmail.com"

password_text_field ={:id => "UserLogin"}
pass="1234"

submit_btn ={:css => "input[value='Login']"}

right_slider={:xpath =>"//*[@id='slider-range']/span[2]"}

deals_tab ={:xpath=>"//*[@id='shopify-section-site-nav']/nav/div/ul/div/li[3]/a"}

test = WebTesterFramework.new("Chrome")



 test.navigate_to(url)
sleep(1)
#test.maximize_window
#test.scroll_window(200 , 10 , 0.2)
#test.perform_click(search_icon)
sleep(1)
#test.set_text(searchBar , search_text)
sleep(1)
# test.perform_click(login_button_xpath)
# sleep(3)
# test.set_text(username_text_field , username)
# test.set_text(password_text_field, pass)
# test.perform_click(submit_btn)
#test.perform_click_xpath(wish_list_xpath)
# test.perform_click(deals_tab)
# sleep(2)
# test.scroll_window(200 , 7 , 0.2)

# test.drag_and_drop(right_slider , -50 , 230)

sleep(10)




# exp1.open_dropdown
# exp1.selectDropDownItem(7)
# exp1.useSearchBar("gaming monitors 27 inch")
# exp1.selectProduct("245657")
# exp1.scrollWindow(500 ,7 , 0.5)
# exp1.quit
