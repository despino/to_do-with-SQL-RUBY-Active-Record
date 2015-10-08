require 'active_record'
require 'rspec'
require 'shoulda-matchers'

require 'task'
require 'list'

database_confirguration = YAML::load(File.open('./db/config.yml'))
test_configuration = database_confirguration["test"]
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Task.all.each { |task| task.destroy }
  end
end
