# frozen_string_literal: true

module Scan
  module Component
    module Result
      class Show < PUI::UI::Page::Show
        private

        def fields
          show_text_field(record, :id)
          show_text_field(record, :host)
          show_text_field(record, :port)
          show_text_field(record, :protocol)
          show_text_field(record, :state)
          show_text_field(record, :service)
        end

        def skip_edit? = true
      end
    end
  end
end
