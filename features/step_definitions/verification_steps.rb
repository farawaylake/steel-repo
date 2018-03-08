

Then(/^the "([^"]*)" card's calendar should show "([^"]*)" days from today$/) do |card_name, days_until_due|

  days_until_due = days_until_due.to_i
  list_component = ListComponent.new
  list_component.navigate_to_card_due_date card_name

  expect(list_component.verify_selected_due_date days_until_due).to be == true

end
