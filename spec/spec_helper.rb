require "bundler/setup"
require 'yaml'

require 'rspec'
require 'pry'

require 'active_record'
require 'active_record/version'
require 'active_support'
require 'active_support/core_ext'

require "redisearch-rails"
ROOT = Pathname(File.expand_path(File.join(File.dirname(__FILE__), '..')))

ActiveSupport::Deprecation.silenced = true

Dir[File.join(ROOT, 'spec', 'support', '**', '*.rb')].each{|f| require f }


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  # config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include ModelReconstruction

  config.before(:all) do
    rebuild_model 'User'
    Redis.new.flushall
  end

  config.after do
    Redis.new.flushall
  end
end
