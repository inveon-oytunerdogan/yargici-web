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
Capybara::Screenshot.autosave_on_failure = true
Capybara.save_path = "Screenshots"

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium
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
