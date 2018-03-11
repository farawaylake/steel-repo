

Then(/^the "([^"]*)" card's calendar should show "([^"]*)" days from today$/) do |card_name, days_until_due|

  days_until_due = days_until_due.to_i
  list_component = ListComponent.new
  list_component.navigate_to_card_due_date card_name

  expect(list_component.verify_selected_due_date days_until_due).to be == true

end

Then (/^the "([^"]*)" should not contain any active cards$/) do |list_name|
  list_component = ListComponent.new
  any_card_in_list = list_component.find_any_card_in_list list_name
  expect(page).not_to have_selector(:xpath,any_card_in_list)
end
