require 'capybara'

class SplashPage

  SIGN_IN_BUTTON = "//*[text()='Log In']"

  def click_log_in
    Capybara.find(:xpath,SIGN_IN_BUTTON).click
  end

end