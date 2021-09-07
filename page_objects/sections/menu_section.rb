# frozen_string_literal: true

class MenuSection < SitePrism::Section
  element :sign_up_link, '.register'
  element :sign_in_link, '.login'
  element :projects_link,  '.projects'
  element :logged_as, '#loggedas'
  element :my_page_link, '#top-menu > ul > li:nth-child(2) > a'
  # element :projects_link,  '#top-menu > ul > li:nth-child(3) > a'

  element :sign_out,  '#account > ul > li:nth-child(2) > a'
end
