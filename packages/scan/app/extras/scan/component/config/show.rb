# frozen_string_literal: true

module Scan
  module Component
    module Config
      class Show < PUI::UI::Page::Show
        def fields
          show_text_field(record, :name, required: true)
          show_text_field(record, :description)
          show_text_field(record, :unit_id, value: record.unit&.name)
          show_text_field(record, :hosts_ranges, value: decorated_record.hosts_ranges)
          show_text_field(record, :ports_ranges, value: decorated_record.ports_ranges)
        end

        private

        def decorated_record = Decorator::Config.new(record)
      end
    end
  end
end
