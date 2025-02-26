# frozen_string_literal: true

module PUI
  module El
    class Paginator < Base
      def initialize(model:, metadata:)
        @model = model
        @metadata = metadata
      end

      def view_template
        div(class: 'flex justify-between w-full p4 mt-4') do
          previous_button
          div(class: 'flex-1')
          next_button
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
        return unless previous_cursor

        button_to(
          polymorphic_url(model),
          method: :get,
          params: params('previous', previous_cursor),
          class: 'btn tooltip',
          data: { tip: I18n.t('pui.el.button.previous') }
        ) { icon_chevron_left }
      end

      def next_button
        return unless next_cursor

        button_to(
          polymorphic_url(model),
          method: :get,
          params: params('next', next_cursor),
          class: 'btn tooltip',
          data: { tip: I18n.t('pui.el.button.next') }
        ) { icon_chevron_right }
      end

      def params(direction, cursor)
        {
          cursor:,
          direction:,
          q: metadata.params[:q]
        }
      end
    end
  end
end
