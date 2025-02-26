# frozen_string_literal: true

module Scan
  module Component
    module Task
      class Show < PUI::UI::Page::Show
        private

        def fields
          show_text_field(record, :id)
          show_text_field(record, :status)
          show_text_field(record, :job_id)
          show_text_field(record, :process_id)
        end

        def skip_edit? = true
      end
    end
  end
end
