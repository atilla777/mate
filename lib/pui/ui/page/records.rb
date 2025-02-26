# frozen_string_literal: true

module PUI
  module UI
    module Page
      class Records < Base
        class_attribute :columns
        class_attribute :filters
        class_attribute :sortables

        private attr_reader :records, :model, :pagination_metadata, :q

        class << self
          def column(title, cell = title, **options)
            raw_title = title
            raw_cell = cell

            title = raw_title.is_a?(Symbol) ? -> { raw_title.to_s.humanize } : raw_title
            cell = raw_cell.is_a?(Symbol) ? ->(record) { record.public_send(raw_cell) } : raw_cell

            self.columns ||= []
            columns << { title:, cell:, **options }
          end

          def filter(title, clause, placeholder = title)
            raw_title = title
            raw_placeholder = placeholder
            title = raw_title.is_a?(Symbol) ? -> { raw_title.to_s.humanize } : raw_title
            placeholder = if raw_placeholder == raw_title
                            title
            else
                            raw_placeholder.is_a?(Symbol) ? -> { raw_placeholder.to_s.humanize } : raw_placeholder
            end

            self.filters ||= []
            filters << {
              title:,
              clause:,
              placeholder:
            }
          end

          def sort(title, column = title)
            self.sortables ||= []
            sortables << {
              title: title.is_a?(Symbol) ? -> { title.to_s.humanize } : title,
              column:,
              default: sortables.empty?
            }
          end
        end

        def initialize(records:, model:, pagination_metadata:, q:)
          @records = records
          @model = model
          @pagination_metadata = pagination_metadata
          @q = q
        end

        def view_template
          div(id: dom_id(model, :records_list), data: { controller: 'record-row' })  do
            filter_form
            records_partial
          end
        end

        private

        def records_partial = raise NotImplementedError

        def filter_form
          div(class: 'pb-4') do
            search_form_for(q, class: 'flex flex-wrap flex-row gap-4 items-end', data: { controller: 'records-filter' }) do |form|
              div(class: 'flex flex-wrap items-end gap-4 ml-2') do
                filters.each do |filter|
                  fieldset(class: 'fieldset') do
                    legend(class: 'fieldset-legend') { try_call(filter[:title]) }
                    raw(
                      safe(
                       form.search_field(filter[:clause], placeholder: try_call(filter[:placeholder]), class: 'input w-32')
                      )
                    )
                  end
                end

                fieldset(class: 'fieldset') do
                  link_to(
                    path(model, sort: sort_params),
                    class: 'btn btn-ghost btn-circle tooltip',
                    data: { tip: I18n.t('pui.button.clear') }
                  ) do
                    icon_x_mark
                  end
                end

                fieldset(class: 'fieldset') do
                  button(
                    type: 'submit',
                    class: 'btn btn-ghost btn-circle tooltip',
                    data: { tip: I18n.t('pui.button.filter') }
                  ) do
                    icon_lens
                  end
                end
              end

              div(class: 'flex flex-wrap items-end gap-4 xl:ml-auto') do
                fieldset(class: 'fieldset tooltip', data: { tip: I18n.t('pui.order.by') }) do
                  select(
                    class: 'select select-ghost w-32 tooltip',
                    name: 'sort[column]',
                    data: { action: 'change->records-filter#submit', tip: I18n.t('pui.order.by') }
                  ) do
                    sort_select_options
                  end
                end

                fieldset(class: 'fieldset m-2') do
                  label(class: 'swap swap-rotate tooltip tooltip-left', data: { tip: asc_desc_tooltip }) do
                    input(
                      type: 'checkbox', name: 'sort[asc]',
                      checked: sort_asc_on?,
                      data: { action: 'change->records-filter#submit' }
                    )
                    icon_bars_down(class: 'swap-off tooltip')
                    icon_bars_up(class: 'swap-on tooltip')
                  end
                end
              end
            end
          end
        end

        def buttons_attributes = { class: 'scale-0 group-hover:scale-100' }

        def try_call(val) = val.respond_to?(:call) ? val.call : val
        def try_call_with(value, *args)  = value.respond_to?(:call) ? value.call(*args) : value
        def default_sortable = sortables.find { it[:default] }

        def sort_select_options
          options_for_select(
            sortables.map { [ try_call(it[:title]), it[:column] ] },
            pagination_metadata.params.dig(:sort, :column),
          )
        end

        def sort_params = pagination_metadata.params[:sort]
        def asc_desc_tooltip = sort_asc_on? ? I18n.t('pui.order.asc') : I18n.t('pui.order.desc')

        def sort_asc_on?
          pagination_metadata.params.dig(:sort, :asc) == 'on'
        end
      end
    end
  end
end
