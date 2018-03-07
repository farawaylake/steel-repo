

When(/^I sign in/) do

  visit("https://trello.com/")
  splash_page = SplashPage.new
  splash_page.click_log_in

end

  sign_in_page = SignInPage.new
  sign_in_page.sign_in

  home_page = HomePage.new
  home_page.click_board 'Test Board'

  list_component = ListComponent.new
  list_component.add_card card_name, '2'

  board_page = BoardPage.new
  board_page.generate_card_name

  puts .card_name

  test = "//*[contains(@class,'js-dpicker-cal')]//*[@class='is-selected']//button"

  puts find(:xpath,test)['data-pika-year']
  puts (find(:xpath,test)['data-pika-month'].to_i + 1)
  puts find(:xpath,test)['data-pika-day']

end
