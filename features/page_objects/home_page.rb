require 'capybara'

class HomePage

  TEST_BOARD_BUTTON_TEMPLATE = "//*[text()='<BOARD_NAME>']"

  def click_board (board_name)
    test_board_button =  TEST_BOARD_BUTTON_TEMPLATE.gsub '<BOARD_NAME>', board_name
    Capybara.find(:xpath,test_board_button).click
  end

end
