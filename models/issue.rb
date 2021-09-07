# frozen_string_literal: true

require 'ffaker'

# This Class describes project object
class Issue
  attr_accessor :tracker, :subject, :description, :status, :priority, :assignee

  def initialize(**args)
    @tracker = args[:tracker] || 'Bug'
    @subject = args[:subject] || FFaker::Lorem.paragraph
    @description = args[:description] || FFaker::Lorem.paragraph
    @status = args[:status] || 'New'
    @priority = args[:priority] || 'Normal'
  end

end