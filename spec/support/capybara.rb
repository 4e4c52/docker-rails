Capybara.register_driver :selenium_chrome_in_container do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new
  # Sandbox cannot be used inside unprivileged Docker container
  browser_options.args << '--no-sandbox'
  browser_options.args << '--headless'
  browser_options.args << '--disable-gpu'
  browser_options.args << '--disable-dev-shm-usage'
  browser_options.args << '--disable-extensions'
  Capybara::Selenium::Driver.new(app, browser: :remote, url: 'http://selenium_chrome:4444/wd/hub',
                                      options: browser_options)
end
