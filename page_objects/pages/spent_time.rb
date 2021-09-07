# frozen_string_literal: true

# This Class describes elements for Spent time Page
class ISpentTimePage < SitePrism::Page
  section :menu, MenuSection, '#top-menu'

  element :user,'#time_entry_user_id'
  element :date_spent_on,'#time_entry_spent_on'
  element :hours,'#time_entry_hours'
  element :comment,'#time_entry_comments'
  element :activity,'#time_entry_activity_id'
  element :create_btn,'#new_time_entry > input[type=submit]:nth-child(6)'

end