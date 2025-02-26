# frozen_string_literal: true

module PUI
  module El
    class Confirm < Base
      def view_template
        dialog(id: "confirm", class: "modal") do
          div(class: "modal-box flex flex-col items-center") do
            icon_warning(class: "size-16 text-warning")
            span(id: "confirm-message", class: "text-xl")

            div(class: "modal-action") do
              form(method: "dialog") do
                button(class: "btn", value: "cancel") do
                  icon_x_mark
                  plain I18n.t("pui.el.button.cancel")
                end
              end
              form(method: "dialog") do
                button(class: "btn", value: "confirm") do
                  icon_check
                  plain I18n.t("pui.el.button.confirm")
                end
              end
            end
          end
        end
      end
    end
  end
end
