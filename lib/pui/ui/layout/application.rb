# frozen_string_literal: true

module PUI
  module UI
    module Layout
      class Application < Phlex::HTML
        include Phlex::Rails::Helpers::CSRFMetaTags
        include Phlex::Rails::Helpers::CSPMetaTag
        include Phlex::Rails::Helpers::StylesheetLinkTag
        include Phlex::Rails::Helpers::JavascriptImportmapTags
        include Phlex::Rails::Helpers::TurboRefreshesWith
        include Phlex::Rails::Helpers::LinkTo

        private attr_accessor :page_info

       def initialize(page_title: nil, menu_items: [])
         @page_title = page_title
         @menu_items = menu_items
       end

        def view_template
          doctype

          html(data: { theme: 'default' }) do
            head do
              title { page_title }

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
              div(class: 'drawer') do
                input(id: 'drawer-1', type: 'checkbox', class: 'drawer-toggle')

                div(class: 'drawer-content flex flex-col h-screen') do
                  render PUI::UI::Misc::Navbar.new(app_title:, menu_items:)

                  div(class: 'flex flex-row') do
                    ul(class: 'menu bg-base-200 w-56 [&_li>*]:rounded-none overflow-y-auto p-0 hidden lg:block mr-2') do
                      menu_items.current_children.each do |item|
                        li do
                          link_to item.url, class: ['pl-2', ('menu-active' if item.active?)] do
                            span(class: [('text-accent' if item.active?)]) do
                              plain item.title
                            end
                          end
                        end
                      end
                    end

                    main(class: 'container mx-auto py-5 flex') { yield }
                  end
                end

                div(class: 'drawer-side') do
                  label(for: 'drawer-1', 'aria-label': 'close sidebar', class: 'drawer-overlay')
                  ul(class: 'menu bg-base-200 min-h-full w-80 p-4') do
                    menu_items.items.each do |item|
                      li do
                        details(open: item.active?) do
                          summary do
                            link_to item.url, class: [('menu-active' if item.active?)] do
                              span(class: [('text-accent' if item.active?)]) do
                                plain item.title
                              end
                            end
                          end

                          ul do
                            item.items.each do |child|
                              li do
                                link_to child.url, class: [('menu-active' if child.active?)] do
                                  span(class: [('text-accent' if child.active?)]) do
                                    plain child.title
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end

                render PUI::UI::Misc::Confirm.new
              end
            end
          end
        end

        private

        attr_reader :page_title, :menu_items

        def app_title = raise NotImplementedError
      end
    end
  end
end