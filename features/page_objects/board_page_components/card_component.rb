require 'capybara'

class CardComponent

  CHANGE_DUE_DATE_BUTTON = "//*[text()='Change Due Date']"
  DUE_DATE_FIELD = "//*[contains(text(),'Date')]//*[contains(@class,'datepicker-select-input')]"
  DUE_DATE_SAVE_BUTTON = "//*[@class='datepicker-confirm-btns']//input[@value='Save']"

  def generate_card_name
    session[:card_name] = 'test' + DateTime.now.strftime("%Y%m%d%H%M%S")
  end

end



