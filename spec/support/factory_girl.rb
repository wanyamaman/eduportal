RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # Validate factory objects before testing
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
