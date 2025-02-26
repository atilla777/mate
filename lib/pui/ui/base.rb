# frozen_string_literal: true

module PUI
  module UI
    class Base < Phlex::HTML
      include Components
      include PUI::UI::Helpers::Icons
      include PUI::UI::Helpers::Button
      include PUI::UI::Helpers::Input
      include Phlex::Rails::Helpers::Routes
      include Phlex::Rails::Helpers::LinkTo
      include Phlex::Rails::Helpers::ButtonTo
      include Phlex::Rails::Helpers::TurboFrameTag
      include Phlex::Rails::Helpers::SubmitTag
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

      def path(model, **options)
        polymorphic_path([ routes_proxy(model), model ], **options)
      end

      def record_path(record, **options)
        polymorphic_path([ record_routes_proxy(record), record ], **options)
      end

      def record_routes_proxy(record)
        engine = if record.respond_to?(:__getobj__)
          record.__getobj__.class.module_parent_name&.underscore
        else
          record.class.module_parent_name&.underscore
        end

        if engine && respond_to?(engine)
          public_send(engine)
        else
          main_app
        end
      end

      def routes_proxy(model)
        engine = model.module_parent_name&.underscore
        if engine && respond_to?(engine) # && public_send(engine).respond_to?(:polymorphic_path)
          public_send(engine)
        else
          main_app
        end
      end
    end
  end
end
