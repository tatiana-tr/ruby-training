class HomePage < SitePrism::Page

  set_url 'http://testautomate.me/redmine/'
  section :menu, MenuSection, '#top-menu'

  element :header, '#header > h1'

end