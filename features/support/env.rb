require 'selenium-webdriver'
require 'capybara'
require 'capybara/webkit'
require 'capybara/cucumber'

browser = :chrome
driver = :selenium

Capybara.default_driver = driver

Capybara.default_max_wait_time = 10

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => browser,)
end


