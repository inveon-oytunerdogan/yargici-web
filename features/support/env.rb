#encoding: UTF-8
require 'cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'rest-client'
require 'capybara-screenshot/cucumber'

Capybara.save_path = File.expand_path(File.join(File.dirname(__FILE__), "../../screenshots/"))
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome,args: ["--window-size=1440,900"])
end


Capybara.javascript_driver = :chrome
#Capybara::Screenshot.autosave_on_failure = true
#Capybara.save_path = "Screenshots"

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium
end

Capybara.register_driver :chrome414x736 do |app|
  args = []
  args << "--window-size=414,736"
  # you can also set the user agent
  args << "--user-agent='Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3'"
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :args => args)
end

#Capybara.default_driver = :selenium
#Capybara.javascript_driver = :selenium

Capybara.app_host = "http://www.tureng.com"

Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_max_wait_time = 10  #default wait time for ajax
Capybara.ignore_hidden_elements = false
Capybara.exact = true

World(Capybara::DSL)
