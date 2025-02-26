# frozen_string_literal: true

module PUI
  module UI
    module Helper
      module Buttons
        class << self
          Rails.application.routes.url_helpers
        end

        private


        def new_record_button(model, params:)
          button_to(
            path(model, action: :new),
            class: 'btn btn-ghost btn-circle tooltip text-primary',
            method: :get,
            params:,
            data: { tip: I18n.t('pui.button.new_record') }
          ) { icon_plus }
        end

        def save_button(attrs = {})
          button(**mix(attrs, { type: 'submit', class: 'btn btn-success' })) { I18n.t('pui.button.save') }
        end

        def show_record_button(record, params:, attrs: {})
          button_to(
            path(record),
            **mix(
              {
                class: 'btn btn-circle btn-ghost tooltip',
                method: :get,
                params:,
                data: { tip: I18n.t('pui.button.show_record') }
              },
              attrs
            )
          ) { icon_eye }
        end

        def edit_record_button(record, attrs = {})
          button_to(
            path(record, action: :edit),
            **mix(
              {
                method: :get,
                class: 'btn btn-circle btn-ghost tooltip tooltip-left',
                data: { tip: I18n.t('pui.button.edit_record') }
              },
              attrs
            )
          ) { icon_pencil }
        end

        def delete_record_button(record, attrs: {}, params:)
          button_to(
            path(record),
            **mix(
              {
                method: :delete,
                params:,
                data: {
                  turbo_confirm: I18n.t('pui.confirm'),
                  tip: I18n.t('pui.button.delete_record')
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
end
