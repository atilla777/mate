require 'nmap/command'
require 'nmap/xml'

module Scan
  module Service
    class Scan
      include IPMixin

      def self.call(...) = new(...).call

      def initialize(config_id:, job_id:)
        @config = Config.find(config_id)
        @job_id = job_id
        @output_file = "#{Rails.root.join('tmp', 'scan')}/scan_result_#{job_id}.xml"
      end

      def call
        create_task
        scan
        save_result
        delete_output
        update_task
      end

      private

      attr_reader :config, :job_id, :output_file, :task

      def create_task
        @task = config.tasks.create(job_id:, process_id: 0, status: :started)
      end

      def scan
        Nmap::Command.sudo do |nmap|
          nmap.syn_scan = true
          nmap.os_fingerprint = true
          nmap.service_scan = true
          nmap.output_xml = output_file
          nmap.verbose = true
          nmap.ports = ports
          nmap.targets = targets
        end
      end

      def ports
        config.config_ports_ranges.flat_map { (it.start..(it.finish || it.start)).to_a }
      end

      def targets
        config.config_hosts_ranges.flat_map do |range|
          (range.start..(range.finish || range.start)).to_a.map { ip_to_string(it) }
        end
      end

      def parsed_results
        Nmap::XML.open(output_file)
                 .each_host
                 .flat_map do |host|
                    host.each_port.map { result_params(host, it) }
                  end
      end

      def result_params(host, port)
        {
          task_id: task.id,
          host: host.ip,
          port: port.number,
          protocol: port.protocol,
          state: port.state,
          service: port.service
        }
      end

      def save_result = Result.insert_all(parsed_results)
      def delete_output = File.delete(output_file)
      def update_task = task.update(status: :finished)
    end
  end
end
