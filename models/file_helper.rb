# frozen_string_literal: true

# This module is responsible for file processing
module FileHelper
  def read_from_yaml_file(file)
    return unless File.exist?(file)

    YAML.safe_load(File.read(file), [Symbol])
  end
end
