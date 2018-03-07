After do | scenario |
end

Before do
  Capybara.page.driver.browser.manage.window.maximize

  Selenium::WebDriver::Driver.class_eval do
    def quit
      #STDOUT.puts "#{self.class}#quit: no-op"
    end
  end

  Selenium::WebDriver::Chrome::Service.class_eval do
    def stop
      #STDOUT.puts "#{self.class}#stop: no-op"
    end
  end

  Capybara::Selenium::Driver.class_eval do
    def reset!
    end
  end

end
