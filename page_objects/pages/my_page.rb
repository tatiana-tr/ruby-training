# frozen_string_literal: true

# This Class describes elements for My Page
class MyPage < SitePrism::Page
  section :menu, MenuSection, '#top-menu'

  element :content, '#content > h2'
  element :assigned_issues, '#block-issuesassignedtome > h3'
  element :reported_issues, '#block-issuesreportedbyme > h3'

  elements :issues_subjects,'*> td.subject > a'
end
