RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'haml',          :version => '2.2.21'
  config.gem 'sqlite3-ruby',  :version => '1.2.5',  :lib => 'sqlite3'

  config.time_zone = 'Pacific Time (US & Canada)'
end
