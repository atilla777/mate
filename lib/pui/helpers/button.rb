# frozen_string_literal: true

module PUI
  module Helpers
    module Button
      private

      def new_record_button(model)
        button_to(
          polymorphic_url(model, action: :new),
          class: 'btn btn-ghost btn-circle tooltip text-primary',
          method: :get,
          data: { tip: I18n.t('pui.el.button.new_record') }
        ) { icon_plus }
      end

      def save_button(attrs = {})
        button(**mix(attrs, { type: 'submit', class: 'btn btn-success' })) { I18n.t('pui.el.button.save') }
      end

      def show_record_button(record, attrs = {})
        link_to(
          polymorphic_url(record),
          **mix(
            {
              class: 'btn btn-ghost tooltip',
              data: { turbo_prefetch: false, tip: I18n.t('pui.el.button.show_record') }
            },
            attrs
          )
        ) { yield }
      end

      def edit_record_button(record, attrs = {})
        link_to(
          polymorphic_url(record, action: :edit),
          **mix(
            {
              class: 'btn btn-circle btn-ghost tooltip tooltip-left',
              data: { turbo_prefetch: false, tip: I18n.t('pui.el.button.edit_record') }
            },
            attrs
          )
        ) { icon_pencil }
      end

      def delete_record_button(record, attrs = {})
        button_to(
          polymorphic_url(record),
          **mix(
            {
              method: :delete,
              data: {
                turbo_confirm: I18n.t('pui.el.confirm'),
                tip: I18n.t('pui.el.button.delete_record')
              },
              class: 'btn btn-circle btn-ghost tooltip tooltip-left'
            },
            attrs
          )
        ) { icon_trash }
      end
    end
  end
end
