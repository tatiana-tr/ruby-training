# frozen_string_literal: true

feature 'New user registration', js: true do
  scenario 'New user can register' do
    @registered_user_yaml_file = "#{DATA}/#{REGISTERED_USER_YAML_FILE}"
    @new_user = User.new

    @home_page = HomePage.new

    @home_page.load
    expect(@home_page.header.text).to include REDMINE_TESTAUTOMATE_HEADER
    @home_page.menu.sign_up_link.click

    register_user(@new_user)

    @my_page = MyPage.new

    @my_page.menu.my_page_link.click

    expect(@my_page.content.text).to include 'My page'
    expect(@my_page.current_url).to include('my/page')
    expect(@my_page.assigned_issues.text).to include('0')
    expect(@my_page.reported_issues.text).to include('0')
  end
end
