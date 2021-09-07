# frozen_string_literal: true

# This Class describes elements for Project Page
class ProjectsPage < SitePrism::Page
  section :menu, MenuSection, '#top-menu'

  element :flash_notice, '#flash_notice'
  element :projects_list, '#projects-index'

  # New project
  element :new_project_link, '#content > div.contextual > a'

  element :project_name, '#project_name'
  element :project_description, '#project_description'
  element :project_identifier, '#project_identifier'
  element :create_btn, '#new_project > input[type=submit]:nth-child(5)'

  elements :projects_title, '#projects-index > ul > * > div > a'
  #projects-index > ul > li:nth-child(2) > div > a
  # //*[@id="projects-index"]/ul/li[2]/div/a
end
