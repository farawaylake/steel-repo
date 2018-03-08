

Then(/^the "([^"]*)" card's calendar should show "([^"]*)" days from today$/) do |card_name, due_date_from_today|

  list_component = ListComponent.new
  list_component.navigate_to_card_due_date card_name

  test = "//*[contains(@class,'js-dpicker-cal')]//*[@class='is-selected']//button"

  puts find(:xpath,test)['data-pika-year']
  puts (find(:xpath,test)['data-pika-month'].to_i + 1)
  puts find(:xpath,test)['data-pika-day']

end
