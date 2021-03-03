module UserHelper

  def save_test_user_to_file(file, user, password)
    File.open(file, 'w') do |f|
      f.puts "#{user}:#{password}"
    end
  end

  def read_from_file (file)
    return unless File.exists?(file)
    user = File.readlines(file)
    user.map! { |i| i.chomp }
    user.map! { |i| i.split(':') }
    user.map! { |i| {user_name: i[0], user_pw: i[1]} }
  end
end