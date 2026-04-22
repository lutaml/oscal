# frozen_string_literal: true

require "oscal"
require "canon/rspec_matchers"
require_relative "support/oscal_content"
require_relative "shared_examples/round_trip"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Exclude slow/NIST tests by default; run with --tag nist or --tag slow
  config.filter_run_excluding slow: true, nist: true
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    Oscal.default_version_module.init_models!
  end
end
