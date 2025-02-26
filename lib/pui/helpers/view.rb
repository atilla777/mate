# frozen_string_literal: true

module PUI
  module Helpers
    module View
      private

      def new_record_button(model)
        button_to(
          polymorphic_url(model, action: :new),
          class: "btn btn-ghost btn-circle tooltip text-primary",
          method: :get,
          data: { tip: I18n.t("pui.el.button.new_record") }
        ) { icon_plus }
      end

      def save_button(attrs = {})
        button(**mix(attrs, { type: "submit", class: "btn btn-success" })) { I18n.t("pui.el.button.save") }
      end

      def edit_record_button(record)
        link_to(
          polymorphic_url(record, action: :edit),
          class: "btn btn-square btn-ghost tooltip",
          data: { turbo_prefetch: false, tip: I18n.t("pui.el.button.edit_record") }
        ) { icon_pencil }
      end

      def delete_record_button(record)
        link_to(
          polymorphic_url(record),
          data: {
            turbo_method: :delete, turbo_confirm: I18n.t("pui.el.confirm"), tip: I18n.t("pui.el.button.delete_record")
          },
          class: "btn btn-square btn-ghost tooltip"
        ) { icon_trash }
      end
    end
  end
end
