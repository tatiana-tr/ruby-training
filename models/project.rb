# frozen_string_literal: true

require 'ffaker'

# This Class describes project object
class Project
  attr_accessor :project_name, :project_description, :project_identifier

  def initialize(**args)
    @project_name = args[:project_name] || FFaker::Company.name
    @project_description = args[:project_description] || FFaker::Lorem.paragraph
    @project_identifier = args[:project_identifier] || FFaker::Guid.guid.downcase
  end

end
