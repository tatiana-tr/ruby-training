# frozen_string_literal: true

# This Class describes elements for Project Page
class IssuesPage < SitePrism::Page
  section :menu, MenuSection, '#top-menu'

  element :flash_notice, '#flash_notice'
  #???
  element :issue_tab,'#main-menu > ul > li:nth-child(3) > a'

  element :new_issue,'#content > div.contextual > a'

  #new issue
  element :issue_tracker,'#issue_tracker_id'
  element :issue_subject,'#issue_subject'
  element :issue_description,'#issue_description'
  element :issue_status_id,'#issue_status_id'
  element :issue_priority_id,'#issue_priority_id'
  element :issue_assigned_to,'#issue_assigned_to_id'
  element :create_btn,'#issue-form > input[type=submit]:nth-child(4)'

  # created issue view
  elements :issues_subjects,'*> td.subject > a'
  elements :issue_assigned_to,:xpath, '//*[@id="content"]/div[2]/div[4]/div/div[1]/div[3]/div[2]/a'
  element :issue_status,:xpath,'//*[@id="content"]/div[3]/div[4]/div/div[1]/div[1]/div[2]'

  #issue time tracking

  elements :log_time, '#content > div:nth-child(1) > a.icon.icon-time-add'
  element :spent_time_label,:xpath,'//*[@id="content"]/div[3]/div[3]/div/div[2]/div[5]/div[1]'
  element :spent_time_value,:xpath,'//*[@id="content"]/div[3]/div[3]/div/div[2]/div[5]/div[2]'
  element :details,:xpath,'#time-entry-121 > ul'
  element :edit,:xpath,'#content > div:nth-child(1) > a.icon.icon-edit'
  element :submit_btn,:xpath,'//*[@id="issue-form"]/input[6]'

end
