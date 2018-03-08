require 'capybara'

class BoardPage
  BOARD_AREA = "//*[@class='board-main-content']"

  def click_empty_board_area
    Capybara.find(:xpath,BOARD_AREA).click
  end

end
