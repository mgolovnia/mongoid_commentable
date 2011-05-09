$:.unshift(File.join(File.dirname(__FILE__),'..','lib'))
$:.unshift(File.join(File.dirname(__FILE__),'models'))
require 'mongoid'
require 'rubygems'
require 'bundler'
require 'logger'
require 'rspec'
require 'rr'
require 'database_cleaner'
require 'mongoid_commentable'
require 'models/comment'
require 'models/commentable_model'


RSpec.configure do |config|
  config.mock_with :rr
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

