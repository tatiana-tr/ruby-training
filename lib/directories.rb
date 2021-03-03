module Directories
  THIS_DIR = File.dirname(__FILE__)
  RUBY = THIS_DIR[/.*ruby/]
  DATA = "#{RUBY}/data".freeze
end
