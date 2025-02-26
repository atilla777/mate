# frozen_string_literal: true

module PUI
  class Base < Phlex::HTML
    include Components
    include PUI::Helpers::Icons
    include PUI::Helpers::Button
    include PUI::Helpers::Input
    include Phlex::Rails::Helpers::Routes
    include Phlex::Rails::Helpers::LinkTo
    include Phlex::Rails::Helpers::ButtonTo
    include Phlex::Rails::Helpers::TurboFrameTag
    include Phlex::Rails::Helpers::SubmitTag
    include Phlex::Rails::Helpers::OptionsForSelect
    include Phlex::Rails::Helpers::SelectTag

    register_output_helper :search_form_for
    # register_value_helper :search_form_for

    if Rails.env.development?
      def before_template
        comment { "Before #{self.class.name}" }

        super
      end
    end

    PageInfo = Data.define(:title)

    def around_template
      layout ? render(layout.new(page_info)) { super } : super
    end

    def page_info = PageInfo.new(title: page_title)

    private

    def layout = nil
    def dom_id(...) = ActionView::RecordIdentifier.dom_id(...)
  end
end
