# frozen_string_literal: true

module PUI
  class Base < Phlex::HTML
    include Components
    include PUI::Helpers::Icons
    include PUI::Helpers::View
    include Phlex::Rails::Helpers::Routes
    include Phlex::Rails::Helpers::LinkTo
    include Phlex::Rails::Helpers::ButtonTo
    include Phlex::Rails::Helpers::TurboFrameTag

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
