# frozen_string_literal: true

# This Class describes elements for Sign in Page
class SignInPage < SitePrism::Page
  section :menu, MenuSection, '#top-menu'

  element :username, '#username'
  element :password, '#password'
  element :login_btn, '#login-submit'
end
