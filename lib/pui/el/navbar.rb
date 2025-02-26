# frozen_string_literal: true

module PUI
  module El
    class Navbar < Base
      private attr_reader :app_title, :menu_items

      def initialize(app_title:, menu_items:)
        @app_title = app_title
        @menu_items = menu_items
      end

      def view_template
        div(class: 'navbar bg-base-100 shadow-sm') do
          div(class: 'navbar-start') do
            div(class: 'dropdown') do
              div(tabindex: '0', role: 'button', class: 'btn btn-ghost lg:hidden') do
                icon_menu
              end
              ul(tabindex: '0', class: 'menu menu-sm dropdown-content bg-base-100 rounded-box z-1 mt-3 w-52 p-2 shadow') do
                li { a { 'Item 1' } }
                li do
                  a { 'Parent' }
                  ul(class: 'p-2') do
                    li { a { 'Submenu 1' } }
                    li { a { 'Submenu 2' } }
                  end
                end
                li { a { 'Item 3' } }
              end
            end
            a(class: 'btn btn-ghost text-xl') { app_title }
          end

          div(class: 'navbar-center hidden lg:flex') do
            ul(class: 'menu menu-horizontal px-1') do
              li { a { 'Item 1' } }
              li do
                details do
                  summary { 'Parent' }
                  ul(class: 'p-2') do
                    li { a { 'Submenu 1' } }
                    li { a { 'Submenu 2' } }
                  end
                end
              end
              li { a { 'Item 3' } }
            end
          end

          div(class: 'navbar-end') do
            render PUI::El::ThemeChanger.new

            button(class: 'btn btn-ghost btn-square') do
              icon_config_menu
            end
          end
        end
      end
    end
  end
end
