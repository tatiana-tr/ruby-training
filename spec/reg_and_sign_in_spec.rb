feature 'Registration and Sign in', js: true do

  before(:all) do
    #@file = "#{Directories::DATA}/#{CommonVars::REGISTERED_USER_TXT}"
    #@random = SecureRandom.hex
    #@user_name = "test#{@random}"
    #@password = "test1234"
    #    save_test_user_to_file(@file, @user_name, @password)

    @registered_user_yaml_file = "#{Directories::DATA}/#{CommonVars::REGISTERED_USER_YAML_FILE}"
    @user = User.new
    @user.save_test_user_to_yaml_file(@registered_user_yaml_file)

  end

   scenario 'User can register' do
    @home_page = HomePage.new

    @home_page.load
    expect(@home_page.header.text).to include CommonVars::REDMINE_TESTAUTOMATE_HEADER
    @home_page.menu.sign_up_link.click

    @sign_up_page = SignUpPage.new

    @sign_up_page.login.set @user.user_name
    @sign_up_page.password.set @user.password
    @sign_up_page.password_confirmation.set @user.password
    @sign_up_page.firstname.set @user.firstname
    @sign_up_page.lastname.set @user.lastname
    @sign_up_page.email.set @user.email

    @sign_up_page.submit_btn.click

    expect(@sign_up_page.menu.logged_as.text).to include "Logged in as #{@user_name}"
   end

  scenario 'User can log in' do
    registered_user = read_from_yaml_file(@file)

    @user_name = registered_user.fetch(:user_name)
    @user_password = registered_user.fetch(:password)

    @home_page = HomePage.new

    @home_page.load
    expect(@home_page.header.text).to include CommonVars::REDMINE_TESTAUTOMATE_HEADER
    @home_page.menu.sign_in_link.click

    @sign_in_page = SignInPage.new

    @sign_in_page.username.set @user_name
    @sign_in_page.password.set @user_password
    @sign_in_page.login_btn.click

    expect(@sign_in_page.menu.logged_as.text).to include "Logged in as #{@user_name}"
  end
end



