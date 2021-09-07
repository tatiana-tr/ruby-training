Given(/^I am not logged in visitor$/) do
  @home_page = HomePage.new
  @home_page.load

  expect(@home_page.header.text).to include REDMINE_TESTAUTOMATE_HEADER
  expect(@home_page.menu.text).not_to include "Logged in as"
end


When(/^I register '([^"]*)' user via Redmine '([^"]*)'$/) do |user_role, reg_type|
  #user_role
  new_user = User.new(user_role: user_role)
  @user = user_role == 'admin' ? @admin = new_user : @developer = new_user

  case reg_type
  when 'UI'
    @home_page.menu.sign_up_link.click
    register_user(@user)
  when 'API'
    api_create_user(@user)
  end
end

Then(/^I see the '([^"]*)' user is registered$/) do |user_role|
  user = user_role == 'admin' ? @admin : @developer
  #api_get_users
  #
  #body =JSON.parse(api_get_users.body)['users']
  # expect(JSON.parse(api_get_users.body)['users']).to include (user.username)
  # expect(body.select{|user| p user['login']}).to include ("0.5908655190198246")
   expect(api_get_users.body).to include (user.username)
end

And(/^I become logged in as '([^"]*)' user$/) do |user_role|
  user = user_role == 'admin' ? @admin : @developer
  expect(@home_page.menu.logged_as.text).to include "Logged in as #{user.username}"
end

When(/^I create a project$/) do
  @home_page.menu.projects_link.click
  @project = Project.new

  create_project(@project)
end

Then(/^I see that project is created on '([^"]*)' level$/) do |level|
  case level
  when 'UI'
    #  sleep 2
    expect(@projects_page.flash_notice.text).to include "Successful creation."
    @home_page.menu.wait_until_projects_link_visible(wait: 5)
    @home_page.menu.projects_link.click
    expect(@home_page.current_url).to include('projects')
    @projects_page.wait_until_projects_list_visible(wait: 5)
    expect(@projects_page.projects_list.text).to include @project.project_name
  when 'API'
    response = api_get_projects(@project.project_identifier)
    expect(response.code).to eq(200)
  end
end

Then(/^I see the issue is created$/) do
  #Issue #154 created.
  expect(@projects_page.flash_notice.text).to include "Issue #{number} created."
  pending
end

When(/^I add '([^"]*)' user as a member of the project$/) do |user_role|
  user = user_role == 'admin' ? @admin : @developer
  assign_member_of_project(@project, user.username, user_role)
end

Then(/^I can can see '([^"]*)' user in the project member list$/) do |user_role|
  user = user_role == 'admin' ? @admin : @developer
  expect(@projects_page.project_member_list.text).to include user.firstname
end

When(/^I logout$/) do
  @home_page.menu.sign_out.click
end

When(/^I login as '([^"]*)' user$/) do |user_role|
  user = user_role == 'admin' ? @admin : @developer

  @home_page.menu.sign_in_link.click

  sign_in(user.username, user.password)
end


When(/^I create an issue and assign '([^"]*)' user to created issue$/) do |user_role|
  user = user_role == 'admin' ? @admin : @developer
  @issue = Issue.new
  @issue.assignee = user
  create_and_assign_user_to_issue(@project, @issue)
end

And(/^I see '([^"]*)' user is assigned to the issue$/) do |user_role|
  user = user_role == 'admin' ? @admin : @developer
  @project_page.issue_tab.click
  @issue_page.issues_subjects.map { |subject| subject.click if subject.text.eql?(@issue.subject) }
  expect(@issue_page.issue_assigned_to.text).to include user.firstname
end

When(/^I track time for the assigned issue$/) do

  track_the_time_for_issue (@issue)

end

Then(/^I see the time is tracked properly$/) do
  expect(@issue_page.flash_notice.text).to include "Successful creation."
  expect(@issue_page.spent_time_label.visible?).to eql true
  #TBD #{@spent_time.hours} to 1.00
  expect(@issue_page.spent_time_value.text).to include "#{@spent_time.hours} h"
  expect(@issue_page.details.text).to include "Spent time: #{@spent_time.hours} h"
end

When(/^I close the issue$/) do
  #TBD
  close_issue(@issue)
end

Then(/^I see the issue was closed$/) do
  expect(@issue_page.flash_notice.text).to be "Successful update."
  expect(@issue_page.issue_status.text).to be "Closed"
end

When(/^I close the project$/) do
  close_project(@project)
end

Then(/^I see it was successfully closed$/) do

  expect(@project_page.warning).to include "This project is closed and read-only."
  @home_page.menu.projects_link.click
  expect(@projects_page.projects_list.text).to_not include @project.project_name
  response = api_get_projects(@project.project_identifier)
  expect(response.code).to eq(404)
end