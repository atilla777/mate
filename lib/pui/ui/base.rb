# frozen_string_literal: true

module PUI
  module UI
    class Base < Phlex::HTML
      include PUI::UI::Helper::Path
      include PUI::UI::Helper::Icons
      include PUI::UI::Helper::Buttons
      include PUI::UI::Helper::Inputs
      include Phlex::Rails::Helpers::Routes
      include Phlex::Rails::Helpers::LinkTo
      include Phlex::Rails::Helpers::ButtonTo
      include Phlex::Rails::Helpers::TurboFrameTag
      include Phlex::Rails::Helpers::OptionsForSelect
      include Phlex::Rails::Helpers::SelectTag

      register_output_helper :search_form_for

      if Rails.env.development?
        def before_template
          comment { "Before #{self.class.name}" }

          super
        end
      end

      def around_template
        layout ? render(layout.new(**layout_params)) { super } : super
      end

      private

      def layout = nil
      def layout_params = {}
      def dom_id(...) = ActionView::RecordIdentifier.dom_id(...)
    end
  end
end
