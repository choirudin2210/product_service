require "rails_helper"

RSpec.describe ActivateProductJob, :type => :job do
  describe "#perform_later" do
    it "uploads a backup" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        ActivateProductJob.set(wait_until: Date.tomorrow.noon, queue: "low").perform_later('backup')
      }.to have_enqueued_job.with('backup').on_queue("low").at(Date.tomorrow.noon)
    end
  end
end