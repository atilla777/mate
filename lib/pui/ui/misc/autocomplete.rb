# frozen_string_literal: true

module PUI
  module UI
    module Misc
      class Autocomplete < Base
        def initialize(records:, keyword:, label_method: :name)
          @records = records
          @keyword = keyword
          @label_method = label_method
        end

        def view_template
          records.each do |record|
            li(
              id: record.id,
              class: 'cursor-pointer border-b border-gray-300 px-4 py-2 hover:bg-blue-100',
              data: { action: 'pointerdown->autocomplete#select' },
              tabindex: '-1'
            ) { highlighted_label(record) }
          end
        end

        private

        attr_reader :records, :keyword, :label_method

        def highlighted_label(record)
          record.name.sub(/^#{Regexp.escape(keyword)}/i) do |match|
            "<strong class='text-error font-bold'>#{match}</strong>"
          end.html_safe
        end

        def label(record) = record.send(label_method)
      end
    end
  end
end
