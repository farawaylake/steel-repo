require 'capybara'

class ListComponent

  ADD_CARD_TO_LIST_TEMPLATE = "//*[text()='<LIST_NAME>' and contains(@class,'list-header-name-assist')]//ancestor::*[contains(@class,'js-list-content')]//*[text()='Add a card…']"
  ADD_CARD_FIELD = "//*[@class='card-composer']//textarea"
  ADD_CARD_BUTTON = "//input[@value='Add']"
  EDIT_CARD_BUTTON_TEMPLATE = "//span[text()='<CARD_NAME>']//ancestor::a[contains(@href,'<CARD_NAME>')]//span[contains(@class,'icon-edit')]"
  CHANGE_DUE_DATE_BUTTON = "//*[text()='Change Due Date']"
  DUE_DATE_FIELD = "//*[contains(text(),'Date')]//*[contains(@class,'datepicker-select-input')]"
  DUE_DATE_SAVE_BUTTON = "//*[@class='datepicker-confirm-btns']//input[@value='Save']"
  QUICK_EDIT_SAVE = "//*[@class='quick-card-editor-card']//*[@value='Save']"

  def add_card_to_list card_name, list_name
    add_card_to_list_button = ADD_CARD_TO_LIST_TEMPLATE.gsub '<LIST_NAME>', list_name

    Capybara.find(:xpath,add_card_to_list_button).click
    Capybara.find(:xpath,ADD_CARD_FIELD).set(card_name)
    Capybara.find(:xpath,ADD_CARD_BUTTON).click
  end

  def navigate_to_card_due_date card_name
    edit_card_button_xpath = EDIT_CARD_BUTTON_TEMPLATE.gsub "<CARD_NAME>", card_name
    Capybara.find(:xpath,edit_card_button_xpath).click
    Capybara.find(:xpath,CHANGE_DUE_DATE_BUTTON).click
  end


  def edit_card_due_date days_until_due
    date = Date.today
    date = date + days_until_due

    date = date.strftime("%m/%d/%Y")

    Capybara.find(:xpath,DUE_DATE_FIELD).set(date)

    Capybara.find(:xpath,DUE_DATE_SAVE_BUTTON).click
  end

  def save_card_quick_edit
    Capybara.find(:xpath,QUICK_EDIT_SAVE).click
  end

end


