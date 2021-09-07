# frozen_string_literal: true

# This Class describes elements for Project Page
class ProjectPage < SitePrism::Page

  set_url 'projects{/projects}'

  element :flash_notice, '#flash_notice'
  element :warning,'#content > p > span'
  # Project Settings
  element :project_actions, '#content > div.contextual > span > span > span'
  element :actions_settings, '#content > div.contextual > span > div > div > a.icon.icon-settings'
  element :action_close_project, '#content > div.contextual > span > div > div > a.icon.icon-lock'

  #Project tabs
  element :actions_settings_tab, '#main-menu > ul > li:nth-child(12) > a'

  # Project>Settings>Members tab
  element :project_settings_tab_members, '#tab-members'
  element :project_member_list, '#tab-content-members > table > tbody'

  # New member
  element :new_member, '#tab-content-members > p > a'
  element :user_search, '#principal_search'
  element :user_checkbox, '#principals > label > input[type=checkbox]'
  #element :section_roles, '#new_membership > fieldset:nth-child(3) > div'
  elements :section_roles, '#new_membership > fieldset:nth-child(3) > div > *'
  element :add_btn, '#member-add-submit'

  # Project>Settings>Issue tracking
  element :tab_issue_tracking, '#tab-issues'
  element :bug_tracker, '#project_trackers > label:nth-child(2) > input[type=checkbox]'
  elements :issue_trackers_checkboxes, '#project_trackers > * > input[type=checkbox]'
  element :save_btn,'#edit_project_427 > p > input[type=submit]'

  #project_trackers > label:nth-child(2) > input[type=checkbox]
  # Issues tab
  element :issues_tab,'.issues'


end