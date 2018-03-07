require 'capybara'

class SignInPage

  USERNAME_FIELD = "//*[@id='user']"
  PASSWORD_FIELD = "//*[@id='password']"
  LOGIN_BUTTON = "//*[@id='login']"

  def initialize
    @trello_credentials = JSON.parse(File.read('features/test_data/trello_credentials.json'))
  end

  def sign_in
    Capybara.find(:xpath,USERNAME_FIELD).set(@trello_credentials['username'])
    Capybara.find(:xpath,PASSWORD_FIELD).set(@trello_credentials['password'])
    Capybara.find(:xpath,LOGIN_BUTTON).click
  end

end