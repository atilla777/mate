module Scan
  class ScanJob < ApplicationJob
    def perform(config_id) = Service::Scan.call(config_id:, job_id:)
  end
end
