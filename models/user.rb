# frozen_string_literal: true

require 'ffaker'
require 'securerandom'
require 'securerandom'
# require 'yaml'

# This Class describes user object
class User
  attr_accessor :username, :password, :firstname, :lastname, :email, :user_role

  def initialize(**args)
    @username = args[:username] || FFaker::Random.rand.to_s
    @password = args[:password] || FFaker::Internet.password
    @firstname = args[:firstname] || FFaker::Name.first_name
    @lastname = args[:lastname] || FFaker::Name.last_name
    @email = args[:email] || FFaker::Internet.email
    @user_role = args[:user_role] || 'default user'
  end

  def to_hash
    {user_role.to_sym => { username: username, password: password, firstname: firstname, lastname: lastname, email: email }}
  end

  def save_test_user_to_yaml_file(file_path)
    Dir.mkdir 'artifacts' unless Dir.exist? 'artifacts'
    File.open(file_path, 'w') do |file|
      file.write to_hash.to_yaml
    end
  end
end

#   @registered_user_yaml_file = "../data/registered_user.yaml"
#  @user = User.new(user_role: 'user')
#  @user.save_test_user_to_yaml_file(@registered_user_yaml_file)
#
# @user = User.new(user_role: 'user2')
# @user.save_test_user_to_yaml_file(@registered_user_yaml_file)
#
# def read_from_yaml_file(file)
#   return unless File.exist?(file)
#   YAML.load_file(file)
#   #YAML.safe_load(File.read(file), [Symbol])
# end
#
# p registered_user = read_from_yaml_file(@registered_user_yaml_file)


#user_name = registered_user.fetch(user_role)
#user_password = registered_user.fetch(:password)