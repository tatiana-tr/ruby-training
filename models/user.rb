# frozen_string_literal: true

require 'securerandom'

class User
  attr_accessor :user_name, :password, :firstname, :lastname, :email

  def initialize(**args)
    random = SecureRandom.hex

    @user_name = args[:user_name] || "test#{random}"
    @password = args[:password] || 'test1234'
    @firstname = args[:firstname] || 'Test'
    @lastname = args[:lastname] || 'User'
    @email = args[:email] || "test#{random}@test.org"
  end

  def to_hash
    { user_name: user_name, password: password, firstname: firstname, lastname: lastname, email: email }
  end

  def save_test_user_to_yaml_file(file)
    File.open(file, 'w') do |f|
      f.write to_hash.to_yaml
    end
  end

  def read_from_yaml_file(file)
    return unless File.exist?(file)

    YAML.load(File.read(file))
  end
end
