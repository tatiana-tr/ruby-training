# frozen_string_literal: true

include CommonStrings

# This Class describes elements for Home Page
class HomePage < SitePrism::Page
  set_url BASE_URL

  section :menu, MenuSection, '#top-menu'

  element :header, '#header > h1'
end
