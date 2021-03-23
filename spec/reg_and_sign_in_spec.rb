# frozen_string_literal: true

feature 'Registration and Sign in', js: true do
  before(:all) do
    @registered_user_yaml_file = "#{DATA}/#{REGISTERED_USER_YAML_FILE}"
    @user = User.new
  end

  scenario 'User can register' do
    @home_page = HomePage.new

    @home_page.load
    expect(@home_page.header.text).to include REDMINE_TESTAUTOMATE_HEADER
    @home_page.menu.sign_up_link.click

    register_user(@user)

    expect(@sign_up_page.menu.logged_as.text).to include "Logged in as #{@user.user_name}"
  end

  scenario 'User can log in' do
    registered_user = read_from_yaml_file(@registered_user_yaml_file)

    user_name = registered_user.fetch(:user_name)
    user_password = registered_user.fetch(:password)

    @home_page = HomePage.new

    @home_page.load
    expect(@home_page.header.text).to include REDMINE_TESTAUTOMATE_HEADER
    @home_page.menu.sign_in_link.click

    sign_in(user_name, user_password)

    expect(@sign_in_page.menu.logged_as.text).to include "Logged in as #{user_name}"
  end
end
