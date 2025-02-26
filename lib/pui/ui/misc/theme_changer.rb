# frozen_string_literal: true

module PUI
  module UI
    module Misc
      class ThemeChanger < Base
        ITEMS = {
          aqua: 'Aqua',
          emerald: 'Emerald',
          black: 'Black',
          business: 'Business',
          cmyk: 'Cmyk',
          dark: 'Dark',
          dim: 'Dim',
          dracula: 'Dracula',
          sunset: 'Sunset',
          silk: 'Silk',
          synthwave: 'Synthwave',
          lofi: 'Lofi',
          light: 'Light',
          nord: 'Nord',
          garden: 'Garden',
          wireframe: 'Wireframe',
          winter: 'Winter'
        }.freeze

        def view_template
          select(class: 'select select-ghost w-32', data: { turbo_permanent: true, choose_theme: true }) do
            option(value: 'nord') { 'Default' }
            ITEMS.each do |key, value|
              option(value: key) { value }
            end
          end
        end
      end
    end
  end
end
