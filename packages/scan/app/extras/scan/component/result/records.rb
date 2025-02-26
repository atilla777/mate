# frozen_string_literal: true

module Scan
  module Component
    module Result
      class Records < PUI::UI::Page::TableRecords
        column :id
        column :host
        column :port
        column :protocol
        column :state
        column :service

        filter :id, :id_eq
        filter :host, :host_cont
        filter :port, :port_cont
        filter :state, :state_eq
        filter :service, :service_cont

        sort :id
        sort :status

        private

        def skip_edit? = true
      end
    end
  end
end
