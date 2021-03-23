# frozen_string_literal: true

require 'ffaker'
require 'securerandom'

# This Class describes user object
class User
  attr_accessor :user_name, :password, :firstname, :lastname, :email

  def initialize(**args)
    random = SecureRandom.hex

    @user_name = args[:user_name] || "test#{random}"
    @password = args[:password] || FFaker::Internet.password
    @firstname = args[:firstname] || FFaker::Name.first_name
    @lastname = args[:lastname] || FFaker::Name.last_name
    @email = args[:email] || FFaker::Internet.email
  end

  def to_hash
    { user_name: user_name, password: password, firstname: firstname, lastname: lastname, email: email }
  end

  def save_test_user_to_yaml_file(file_path)
    File.open(file_path, 'w') do |file|
      file.write to_hash.to_yaml
    end
  end

end
