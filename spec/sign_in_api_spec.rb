# frozen_string_literal: true

feature 'Sign in', js: true do
  scenario 'User can log in' do
    @user = User.new
    api_create_user(@user)
    @home_page = HomePage.new

    @home_page.load
    expect(@home_page.header.text).to include REDMINE_TESTAUTOMATE_HEADER
    @home_page.menu.sign_in_link.click

    sign_in(@user.username, @user.password)

    expect(@sign_in_page.menu.logged_as.text).to include "Logged in as #{@user.username}"
  end
end
