# frozen_string_literal: true

module Scan
  module Service
    class StringRangeToInteger
      def self.call(...) = new(...).call

      def initialize(range)
        @start_ip, @finish_ip = range.split(IntegerRangeToString::RANGE_SEPARATOR).map(&:strip)
      end

      def call = { start: ip_to_integer(start_ip), finish: ip_to_integer(finish_ip) }

      private

      attr_reader :start_ip, :finish_ip

      def ip_to_integer(string)
        return unless string

        IPAddr.new(string).to_i
      end
    end
  end
end
