# frozen_string_literal: true

module UI
  module Base
    class Index < Components::Base
      def view_template
        h1(class: "text-primary tooltip", data_tip: "Index") { "Index" }
      end
    end
  end
end
