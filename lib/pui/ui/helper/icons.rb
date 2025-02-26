# frozen_string_literal: true

module PUI
  module UI
    module Helper
      module Icons
        private

        def icon_bars_down(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              d: 'M3 4.5h14.25M3 9h9.75M3 13.5h9.75m4.5-4.5v12m0 0-3.75-3.75M17.25 21 21 17.25'
            )
          end
        end

        def icon_bars_up(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              d: 'M3 4.5h14.25M3 9h9.75M3 13.5h5.25m5.25-.75L17.25 9m0 0L21 12.75M17.25 9v12'
            )
          end
        end

        def icon_menu(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              stroke_width: '2',
              d: 'M4 6h16M4 12h16M4 18h16'
            )
          end
        end

        def icon_config_menu(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              stroke_width: '2',
              d: 'M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z'
            )
          end
        end

        def icon_bell(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              stroke_width: '2',
              d: 'M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9'
            )
          end
        end

        def icon_lens(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              stroke_width: '2',
              d: 'M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z'
            )
          end
        end

        def icon_pencil(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              d: 'm16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10'
            )
          end
        end

        def icon_trash(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              d: 'm14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0'
            )
          end
        end

        def icon_warning(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              d: 'M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z'
            )
          end
        end

        def icon_check(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(stroke_linecap: 'round', stroke_linejoin: 'round', d: 'm4.5 12.75 6 6 9-13.5')
          end
        end

        def icon_x_mark(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(stroke_linecap: 'round', stroke_linejoin: 'round', d: 'M6 18 18 6M6 6l12 12')
          end
        end

        def icon_plus(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(stroke_linecap: 'round', stroke_linejoin: 'round', d: 'M12 4.5v15m7.5-7.5h-15')
          end
        end
        def icon_eye(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              "stroke-linecap": 'round',
              "stroke-linejoin": 'round',
              d: 'M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z'
            )
            s.path(
              "stroke-linecap": 'round',
              "stroke-linejoin": 'round',
              d: 'M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z'
            )
          end
        end

        def icon_chevron_left(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              d: 'M15.75 19.5 8.25 12l7.5-7.5'
            )
          end
        end

        def icon_chevron_right(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              d: 'm8.25 4.5 7.5 7.5-7.5 7.5'
            )
          end
        end

        def icon_play(attrs = {})
          svg(**icon_attributes(attrs)) do |s|
            s.path(
              stroke_linecap: 'round',
              stroke_linejoin: 'round',
              d: 'M5.25 5.653c0-.856.917-1.398 1.667-.986l11.54 6.347a1.125 1.125 0 0 1 0 1.972l-11.54 6.347a1.125 1.125 0 0 1-1.667-.986V5.653Z'
            )
          end
        end

        def icon_attributes(attrs)
          mix(
            {
              xmlns: 'http://www.w3.org/2000/svg',
              fill: 'none',
              viewBox: '0 0 24 24',
              stroke_width: '1.5',
              stroke: 'currentColor',
              class: 'size-6'
            },
            attrs
          )
        end
      end
    end
  end
end
