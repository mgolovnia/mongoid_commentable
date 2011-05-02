
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'mongoid'
require 'rubygems'
require 'bundler'
require 'logger'
require 'rspec'
require 'database_cleaner'
require 'mongoid_commentable'


RSpec.configure do |config|
  config.mock_with :rspec
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("mongoid_commentable_test")
end

