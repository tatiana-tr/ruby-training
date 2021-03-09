require 'securerandom'

class User

  attr_accessor :user_name, :password, :firstname, :lastname, :email

  def initialize (**args)

    @random = SecureRandom.hex

    @user_name = args[:user_name] || "test#{@random}"
    @password = args[:password] || "test1234"
    @firstname = args[:firstname] || 'Test'
    @lastname = args[:lastname] || 'User'
    @email = args[:email] || "test#{@random}@test.org"

  end

  def to_hash
    { user_name: user_name, password: password, firstname: firstname, lastname: lastname, email: email }
  end

end
