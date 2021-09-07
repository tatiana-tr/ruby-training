# frozen_string_literal: true

Given(/^I visit Redmine homepage$/) do
  @home_page = HomePage.new
  @home_page.load
end

And(/^I have preregistered user$/) do
  @user = User.new
  api_create_user(@user)
end

When(/^I click '([^"]*)' button$/) do |button|
  if button == 'login'
    @home_page.menu.sign_in_link.click
  else
    @home_page.menu.sign_up_link.click
  end
end

And(/^I fill in login form$/) do
  sign_in(@user.username, @user.password)
end

Then(/^I see that I become logged in user$/) do
  expect(@home_page.menu.logged_as.text).to include "Logged in as #{@user.username}"
end

And(/^I fill in registration form$/) do
  @user = User.new
  register_user(@user)
end
