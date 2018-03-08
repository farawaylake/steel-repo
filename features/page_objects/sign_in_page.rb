require 'capybara'

class SignInPage

  USERNAME_FIELD = "//*[@id='user']"
  PASSWORD_FIELD = "//*[@id='password']"
  LOGIN_BUTTON = "//*[@id='login']"
  PATH_TO_TRELLO_CREDENTIALS = 'features/data/trello_credentials.json'

  def sign_in
    @trello_credentials = JSON.parse(File.read(PATH_TO_TRELLO_CREDENTIALS))
    Capybara.find(:xpath,USERNAME_FIELD).set(@trello_credentials['username'])
    Capybara.find(:xpath,PASSWORD_FIELD).set(@trello_credentials['password'])
    Capybara.find(:xpath,LOGIN_BUTTON).click
  end

  def sign_in_custom_credentials (username, password)
    Capybara.find(:xpath,USERNAME_FIELD).set(username)
    Capybara.find(:xpath,PASSWORD_FIELD).set(password)
    Capybara.find(:xpath,LOGIN_BUTTON).click
  end

end