# frozen_string_literal: true

module Scan
  module Decorator
    class Config < SimpleDelegator
      LIST_SEPARATOR = ', '

      def cell = "#{name} #{description}"

      def ports_ranges = config_ports_ranges.map { [it.start, it.finish].compact.join('-') }.join(LIST_SEPARATOR)

      def hosts_ranges
        config_hosts_ranges.map { Service::IntegerRangeToString.call(it.start, it.finish) }.join(LIST_SEPARATOR)
      end
    end
  end
end
