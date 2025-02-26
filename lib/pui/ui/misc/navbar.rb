# frozen_string_literal: true

module PUI
  module UI
    module Misc
      class Navbar < Base
        private attr_reader :app_title, :menu_items

        def initialize(app_title:, menu_items:)
          @app_title = app_title
          @menu_items = menu_items
        end

        def view_template
          div(class: 'navbar bg-base-300 shadow-sm') do
            div(class: 'flex-none lg:hidden') do
              label(for: 'drawer-1', 'aria-label': 'open sidebar', class: 'btn btn-square btn-ghost') do
                icon_menu
              end
            end

            div(class: 'navbar-start') do
              a(class: 'btn btn-ghost text-xl hidden lg:block') { app_title }
            end

            div(class: 'navbar-center hidden lg:flex') do
              ul(class: 'menu menu-horizontal px-1') do
                menu_items.items.each do |item|
                  li do
                    link_to item.url, class: [ ('menu-active' if item.active?) ] do
                      span(class: [ 'text-lg', ('text-accent' if item.active?) ]) do
                        plain item.title
                      end
                    end
                  end
                end
              end
            end

            div(class: 'navbar-end') do
              render PUI::UI::Misc::ThemeChanger.new

              button(class: 'btn btn-ghost btn-square') do
                icon_config_menu
              end
            end
          end
        end
      end
    end
  end
end
