module Scan
  module Service
    module IPMixin
      def ip_to_string(ip)
        return unless ip

        IPAddr.new(ip, Socket::AF_INET).to_s
      end
    end
  end
end
