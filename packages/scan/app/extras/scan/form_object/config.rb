# frozen_string_literal: true

module Scan
  module FormObject
    class Config < SimpleDelegator
      def initialize(record, attributes)
        super(record)

        @record = record
        @new_record = record.new_record?
        @attributes = attributes.except(:port_ranges, :hosts_ranges)
        @ports_attributes = attributes[:ports_ranges]
        @hosts_attributes = attributes[:hosts_ranges]
      end

      def save
        assign_attributes(attributes)

        with_transaction_returning_status do
          super && save_ports_ranges && save_hosts_ranges
        end

        record
      end

      private

      attr_reader :record, :new_record, :attributes, :ports_attributes, :hosts_attributes

      def save_ports_ranges
        delete_previous(:config_ports_ranges)

        ports_ranges.all? { config_ports_ranges.new(it).save }
      end

      def save_hosts_ranges
        delete_previous(:config_hosts_ranges)

        hosts_ranges.all? { config_hosts_ranges.new(it).save }
      end

      def delete_previous(relation)
        public_send(relation).destroy_all unless new_record
      end

      def ports_ranges
        ports_attributes.split(',').map do |range|
          start, finish = range.split('-').map(&:to_i)
          { start:, finish: }
        end
      end

      def hosts_ranges
        hosts_attributes.split(',').map do |range|
          Scan::Service::StringRangeToInteger.call(range)
        end
      end
    end
  end
end
