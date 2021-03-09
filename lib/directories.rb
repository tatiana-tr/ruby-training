module Directories
  THIS_DIR = File.dirname(__FILE__)
  RUBY = THIS_DIR[/.*ruby-training/]
  DATA = "#{RUBY}/data".freeze
end
