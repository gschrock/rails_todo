RSpec.configure do |config|
  # NOTE: truncate db before running test suite
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  # NOTE: before each test (non-js) create data and
  # rollback transaction (faster than truncating db)
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  # NOTE: for every js test run truncation
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end
  # NOTE: before each test run database cleaner
  config.before(:each) do
    DatabaseCleaner.start
  end
  # NOTE: after each test clean up db
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
