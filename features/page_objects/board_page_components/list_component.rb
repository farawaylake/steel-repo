require 'capybara'
require 'rspec'

class ListComponent

  ADD_CARD_FIELD = "//*[@class='card-composer']//textarea"
  ADD_CARD_BUTTON = "//input[@value='Add']"
  CHANGE_DUE_DATE_BUTTON = "//*[text()='Change Due Date']"
  DUE_DATE_FIELD = "//*[contains(text(),'Date')]//*[contains(@class,'datepicker-select-input')]"
  DUE_DATE_SAVE_BUTTON = "//*[@class='datepicker-confirm-btns']//input[@value='Save']"
  QUICK_EDIT_SAVE = "//*[@class='quick-card-editor-card']//*[@value='Save']"
  SELECTED_CALENDAR_DUE_DATE = "//*[contains(@class,'js-dpicker-cal')]//*[contains(@class,'is-selected')]//button"
  ARCHIVE_ALL_CARDS_IN_LIST = "//*[text()='Archive All Cards in This List…']"
  ARCHIVE_ALL_CARDS_CONFIRMATION = "//*[@value='Archive All']"

  ADD_CARD_TO_LIST_TEMPLATE = "//*[text()='<LIST_NAME>' and contains(@class,'list-header-name-assist')]//ancestor::*[contains(@class,'js-list-content')]//*[text()='Add a card…']"
  EDIT_CARD_BUTTON_TEMPLATE = "//span[text()='<CARD_NAME>']//ancestor::a[contains(@href,'<CARD_NAME>')]//span[contains(@class,'icon-edit')]"
  LIST_OVERFLOW_MENU_TEMPLATE = "//*[text()='<LIST_NAME>']//ancestor::*[contains(@class,'js-list-header')]//*[contains(@class,'icon-overflow-menu-horizontal')]"
  ANY_CARD_ON_LIST_TEMPLATE = "//*[text()='<LIST_NAME>' and contains(@class,'list-header-name-assist')]//ancestor::*[contains(@class,'js-list-content')]//*[contains(@class,'list-card-title')]"

  def add_card_to_list (card_name, list_name)
    add_card_to_list_button = ADD_CARD_TO_LIST_TEMPLATE.gsub '<LIST_NAME>', list_name

    Capybara.find(:xpath,add_card_to_list_button).click
    Capybara.find(:xpath,ADD_CARD_FIELD).set(card_name)
    Capybara.find(:xpath,ADD_CARD_BUTTON).click
  end

  def navigate_to_card_due_date (card_name)
    edit_card_button_xpath = EDIT_CARD_BUTTON_TEMPLATE.gsub "<CARD_NAME>", card_name
    Capybara.find(:xpath,edit_card_button_xpath).click
    Capybara.find(:xpath,CHANGE_DUE_DATE_BUTTON).click
  end

  def select_list_overflow (list_name)
    list_overview_menu_button = LIST_OVERFLOW_MENU_TEMPLATE.gsub "<LIST_NAME>", list_name
    Capybara.find(:xpath,list_overview_menu_button).click
  end

  def select_archive_all_cards
    Capybara.find(:xpath,ARCHIVE_ALL_CARDS_IN_LIST).click
    Capybara.find(:xpath,ARCHIVE_ALL_CARDS_CONFIRMATION).click
  end


  def edit_card_due_date (days_until_due)
    days_until_due = days_until_due.to_i
    date = Date.today
    date = date + days_until_due
    date = date.strftime("%m/%d/%Y")

    Capybara.find(:xpath,DUE_DATE_FIELD).set(date)
    Capybara.find(:xpath,DUE_DATE_SAVE_BUTTON).click
  end

  def save_card_quick_edit
    Capybara.find(:xpath,QUICK_EDIT_SAVE).click
  end

  def verify_selected_due_date (days_until_due)
    year = Capybara.find(:xpath,SELECTED_CALENDAR_DUE_DATE)['data-pika-year']
    month = (Capybara.find(:xpath,SELECTED_CALENDAR_DUE_DATE)['data-pika-month'].to_i + 1).to_s
    day = Capybara.find(:xpath,SELECTED_CALENDAR_DUE_DATE)['data-pika-day']

    date = Date.today
    date = date + days_until_due

    ((year == (date.strftime('%Y'))) && month ==(date.strftime('%m').to_i.to_s) && day == (date.strftime('%d').to_i.to_s))
  end

  def find_any_card_in_list (list_name)
    return ANY_CARD_ON_LIST_TEMPLATE.gsub "<LIST_NAME>", list_name
  end

end



