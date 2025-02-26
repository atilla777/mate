# frozen_string_literal: true

module Scan
  module Service
    class IntegerRangeToString
      RANGE_SEPARATOR = '-'

      def self.call(...) = new(...).call

      def initialize(start, finish)
        @start = start
        @finish = finish
      end

      def call = [ip_to_string(start), ip_to_string(finish)].compact.join(RANGE_SEPARATOR)

      private

      attr_reader :start, :finish

      def ip_to_string(ip)
        return unless ip

        IPAddr.new(ip, Socket::AF_INET).to_s
      end
    end
  end
end
