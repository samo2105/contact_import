require 'rails_helper' 
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe CsvFileParserWorker do
  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    described_class.perform_later(1, '')
    assert_equal "default", described_class.queue_as
  end
end