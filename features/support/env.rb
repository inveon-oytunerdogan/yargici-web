#encoding: UTF-8
require 'cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'rest-client'

$screenshot_counter = 0
Capybara.save_path = File.expand_path(File.join(File.dirname(__FILE__), "../../screenshots/"))

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium

Capybara.app_host = "http://www.tureng.com"

Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_max_wait_time = 10  #default wait time for ajax
Capybara.ignore_hidden_elements = false
Capybara.exact = true

World(Capybara::DSL)
