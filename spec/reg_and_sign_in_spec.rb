feature 'Registration and Sign in', js: true do

  file = "#{Directories::DATA}/#{CommonVars::REGISTERED_USERS}"

  scenario 'User can register' do
    random = Time.now.to_i.to_s
    user_name = "test#{random}"
    password = "test1234"
    save_test_user_to_file(file, user_name, password)

    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.register').click

    find('#user_login').set user_name
    find('#user_password').set password
    find('#user_password_confirmation').set 'test1234'
    find('#user_firstname').set 'Test'
    find('#user_lastname').set 'User'
    find('#user_mail').set "test#{random}@test.org"

    find('#new_user > input[type=submit]:nth-child(4)').click

    expect(page).to have_content 'Logged in as test'
  end

  scenario 'User can log in' do
    user = read_from_file(file)[0]
    @user_name = user[:user_name]
    @user_password = user[:user_pw]
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.login').click

    find('#username').set @user_name
    find('#password').set @user_password
    find('#login-submit').click

    expect(page).to have_content 'Logged in as test'
  end
end



