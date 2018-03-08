

#When(/^I sign in 1:"([^"]*)" 2:"([^"]*)"/) do |board_name, card_name|
When(/^I sign in to the trello home page$/) do

  visit("https://trello.com/")
  splash_page = SplashPage.new
  splash_page.click_log_in

  sign_in_page = SignInPage.new
  sign_in_page.sign_in

end

When(/^I navigate to the "([^"]*)" board$/) do |board_name|

  home_page = HomePage.new
  home_page.click_board board_name

end

When(/^I add the "([^"]*)" card to the "([^"]*)" list$/) do |card_name, list_name|
  list_component = ListComponent.new
  list_component.add_card_to_list card_name, list_name
end

When(/^I update the "([^"]*)" card due date to "([^"]*)" days from today$/) do |card_name, days_until_due|

  list_component = ListComponent.new
  list_component.navigate_to_card_due_date card_name
  list_component.edit_card_due_date days_until_due
  list_component.save_card_quick_edit
end

