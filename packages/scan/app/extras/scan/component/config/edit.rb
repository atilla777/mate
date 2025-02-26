# frozen_string_literal: true

module Scan
  module Component
    module Config
      class Edit < PUI::UI::Page::Edit
        def fields(form)
          autocomplete_text_field(form, :unit_id, Unit, record.unit&.name, required: true)
          edit_text_field(form, :name, required: true)
          edit_text_field(form, :description)
          edit_text_field(form, :ports_ranges, value: decorated_record.ports_ranges, required: true)
          edit_text_field(form, :hosts_ranges, value: decorated_record.hosts_ranges, required: true)
        end

        private

        def decorated_record = Decorator::Config.new(record)
      end
    end
  end
end
