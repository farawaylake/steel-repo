require 'capybara'

class ListComponent

  ADD_CARD_TO_LIST_TEMPLATE = "//*[@id='board']/div[<LIST_NUMBER>]//*[text()='Add a card…']"
  ADD_CARD_FIELD = "//*[@class='card-composer']//textarea"
  ADD_CARD_BUTTON = "//input[@value='Add']"
  EDIT_CARD_BUTTON_TEMPLATE = "//span[text()='<CARD_TITLE>']//ancestor::a[contains(@href,'<CARD_TITLE>')]//span[contains(@class,'icon-edit')]"

  def add_card card_name, list_number

    add_card_to_list_button = ADD_CARD_TO_LIST_TEMPLATE.gsub! '<LIST_NUMBER>', list_number

    Capybara.find(:xpath,add_card_to_list_button).click
    Capybara.find(:xpath,ADD_CARD_FIELD).set(card_name)
    Capybara.find(:xpath,ADD_CARD_BUTTON).click
  end




  #
  # edit_card_button_xpath = edit_card_button_template_xpath.gsub! "RUNTIME_STRING", card_name
  #
  # find(:xpath,edit_card_button_xpath).click
  #
  # find(:xpath,change_due_date_button_xpath).click
  # date = Date.today
  # date = date + 3
  #
  # date = date.strftime("%m/%d/%Y")
  #
  #
  #
  # find(:xpath,due_date_field_xpath).set(date)
  #
  # find(:xpath,due_date_save_button_xpath).click
  # find(:xpath,change_due_date_button_xpath).click


end



