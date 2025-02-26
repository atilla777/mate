# frozen_string_literal: true

module PUI
  module Layout
    class Application < Phlex::HTML
      include Phlex::Rails::Helpers::CSRFMetaTags
      include Phlex::Rails::Helpers::CSPMetaTag
      include Phlex::Rails::Helpers::StylesheetLinkTag
      include Phlex::Rails::Helpers::JavascriptImportmapTags
      include Phlex::Rails::Helpers::TurboRefreshesWith

      DEFAULT_THEME = 'dark'

      private attr_accessor :page_info

     def initialize(page_info = nil)
       @page_info = page_info
     end

      def view_template
        doctype

        html(data: { theme: 'default' }) do
          head do
            title { page_info.title }

            meta(name: "viewport", content: "width=device-width,initial-scale=1")
            meta(name: "apple-mobile-web-app-capable", content: "yes")
            meta(name: "mobile-web-app-capable", content: "yes")

            meta(name: "turbo-refresh-method", content: "morph")
            meta(name: "turbo-refresh-scroll", content: "preserve")
            # turbo_refreshes_with(method: :morph, scroll: :preserve)
            # yield :head

            csrf_meta_tags
            csp_meta_tag

            # Enable PWA manifest for installable apps (make sure to enable in config/routes.rb too!)
            # tag.link(rel: "manifest", href: pwa_manifest_path(format: :json))

            link(rel: "icon", href: "/icon.png", type: "image/png")
            link(rel: "icon", href: "/icon.svg", type: "image/svg+xml")
            link(rel: "apple-touch-icon", href: "/icon.png")

            # Includes all stylesheet files in app/assets/stylesheets
            stylesheet_link_tag :app, "data-turbo-track": "reload"
            javascript_importmap_tags
          end

          body do
            render PUI::El::Navbar.new(app_title: 'M.A.T.E.', menu_items: [Unit])
            main(class: 'container mx-auto py-5 flex') { yield }
            render PUI::El::Confirm.new
          end
        end
      end
    end
  end
end
