# frozen_string_literal: true

module Scan
  module Component
    module Config
      class Show < PUI::UI::Page::Show
        def fields
          show_text_field(record, :name, required: true)
          show_text_field(record, :description)
          show_text_field(record, :unit_id)
        end
      end
    end
  end
end
