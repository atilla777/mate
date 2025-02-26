# frozen_string_literal: true

module PUI
  module El
    class ThemeChanger < Base
      ITEMS = {
        dark: "Dark",
        dracula: "Dracula",
        synthwave: "Synthwave",
        cupcake: "Cupcake",
        nord: "Nord"
      }.freeze

      def view_template
        select(class: "select select-ghost w-32", data: { turbo_permanent: true, choose_theme: true }) do
          option(value: "") { "Default" }
          ITEMS.each do |key, value|
            option(value: key) { value }
          end
        end
      end
    end
  end
end
