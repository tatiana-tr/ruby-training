# frozen_string_literal: true

require 'capybara/cucumber'
require 'dotenv/load'
require 'require_all'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec/expectations'
require 'yaml'

require_all 'data'
require_all 'models'
require_all 'page_objects/sections'
require_all 'page_objects/pages'

include CommonStrings
include Directories

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000 --headless])
end

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
