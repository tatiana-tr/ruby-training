# frozen_string_literal: true

module FeatureHelper
  def register_user(user)
    @registered_user_yaml_file = "#{ARTIFACTS}/#{REGISTERED_USER_YAML_FILE}"
    @user = user
    @user.save_test_user_to_yaml_file(@registered_user_yaml_file)

    @sign_up_page = SignUpPage.new

    @sign_up_page.login.set @user.username
    @sign_up_page.password.set @user.password
    @sign_up_page.password_confirmation.set @user.password
    @sign_up_page.firstname.set @user.firstname
    @sign_up_page.lastname.set @user.lastname
    @sign_up_page.email.set @user.email

    @sign_up_page.submit_btn.click
  end

  def sign_in(user_name, user_password)
    @sign_in_page = SignInPage.new

    @sign_in_page.username.set user_name
    @sign_in_page.password.set user_password
    @sign_in_page.login_btn.click
  end

  def create_project(project)
    @projects_page = ProjectsPage.new
    @projects_page.new_project_link.click

    @projects_page.project_name.set project.project_name
    @projects_page.project_description.set project.project_description
    @projects_page.project_identifier.set project.project_identifier
    @projects_page.create_btn.click
  end

  def assign_member_of_project (project, member, user_role)
    @project=project
    @projects_page = ProjectsPage.new
    binding.pry

    @projects_page.projects_title.map { |project| project.click if project.text.eql?(@project.project_name) }
    #@projects_page.projects_title.map { |project| project.click if project['href'].include?(@project.project_identifier) }
    @project_page = ProjectPage.new
    # else
    # @project_page.load (projects: "#{project.project_identifier}")
    #@project_page.project_actions.click
    @project_page.actions_settings_tab.click
    #@project_page.actions_settings.click
    @project_page.project_settings_tab_members.click
    @project_page.new_member.click
    @project_page.user_search.set member
    @project_page.user_checkbox.click
    @project_page.section_roles.map { |role| role.click if role.text.eql?(user_role.capitalize) }

    @project_page.add_btn.click

  end

  def create_and_assign_user_to_issue (project, issue)

    @project_page.load(projects: "#{project.project_identifier}")
    #@project_page = ProjectPage.new
    @project_page.actions_settings_tab
    @project_page.tab_issue_tracking.click
    @project_page.issue_trackers_checkboxes.map { |tracker| tracker.click if tracker.text.eql?('Bug') }
    @project_page.save_btn.click

    @project_page.issues_tab.click

    #fill fields

    @issue = issue

    @issue_page = IssuesPage.new
    @issue_page.new_issue.click
    @issue_page.issue_tracker.select @issue.tracker
    @issue_page.issue_subject.set @issue.subject
    @issue_page.issue_description.set @issue.description
    @issue_page.issue_status_id.select @issue.status
    @issue_page.issue_priority_id.select @issue.priority
    @issue_page.issue_assigned_to.select @issue.assignee
    @issue_page.create_btn.click

  end

  def track_the_time_for_issue  (issue)
    @home_page.menu.my_page_link.click

    @my_page = MyPage.new

    @my_page.issues_subjects.map { |subject| subject.click if subject.text.eql?(issue.subject) }

    @issue_page.log_time.click

    @spent_time_page = ISpentTimePage.new

    @spent_time_page.hours.set "10"
    @spent_time_page.activity.select "Design"
    @spent_time_page.create_btn.click

  end

  def close_issue (issue)

    @issue_page.edit.click
    @issue_page.status.select "Closed"
    @issue_page.submit_btn.click
  end

  def close_project (project)
    @project_page.load(projects: "#{project.project_identifier}")
    @project_page.actions_settings.click
    @project_page.action_close_project.click
    page.driver.browser.switch_to.alert.accept
  end

end

World(FeatureHelper)
