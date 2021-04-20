# frozen_string_literal: true

module FeatureHelper
  def register_user(user)
    @user = user
    @user.save_test_user_to_yaml_file(@registered_user_yaml_file)

    @sign_up_page = SignUpPage.new

    @sign_up_page.login.set @user.user_name
    @sign_up_page.password.set @user.password
    @sign_up_page.password_confirmation.set @user.password
    @sign_up_page.firstname.set @user.firstname
    @sign_up_page.lastname.set @user.lastname
    @sign_up_page.email.set @user.email

    @sign_up_page.submit_btn.click
  end

  def sign_in(user_name, user_password)
    @sign_in_page = SignInPage.new

    @sign_in_page.username.set user_name
    @sign_in_page.password.set user_password
    @sign_in_page.login_btn.click
  end
end
