require 'yaml'

module UserHelper

  def save_test_user_to_yaml_file(file)
    File.open(file, 'w') do |f|
      f.write self.to_hash.to_yaml
    end
  end

  def read_from_yaml_file(file)
    return unless File.exists?(file)
    YAML.load(File.read(file))
  end

end