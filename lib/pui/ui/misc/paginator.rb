# frozen_string_literal: true

module PUI
  module UI
    module Misc
      class Paginator < Base
        def initialize(model:, metadata:)
          @model = model
          @metadata = metadata
        end

        def view_template
          div(class: 'flex space-x-2') do
            fieldset(class: 'fieldset') { previous_button }
            fieldset(class: 'fieldset') { next_button }
          end
        end

        private

        attr_reader :model, :metadata

        with_options to: :metadata, private: true do
          delegate :total
          delegate :total_pages
          delegate :next_cursor
          delegate :previous_cursor
        end

        def previous_button
          return if [ previous_cursor, next_cursor ].none?

          button_to(
            path(model),
            method: :get,
            disabled: previous_cursor.nil?,
            params: params('previous', previous_cursor),
            class: 'btn btn-ghost btn-circle tooltip',
            data: { tip: I18n.t('pui.el.button.previous') }
          ) { icon_chevron_left }
        end

        def next_button
          return if [ previous_cursor, next_cursor ].none?

          button_to(
            path(model),
            method: :get,
            disabled: next_cursor.nil?,
            params: params('next', next_cursor),
            class: 'btn btn-ghost btn-circle tooltip',
            data: { tip: I18n.t('pui.el.button.next') }
          ) { icon_chevron_right }
        end

        def params(direction, cursor)
          {
            cursor:,
            direction:,
            q: metadata.params[:q],
            sort: metadata.params[:sort]
          }
        end
      end
    end
  end
end
