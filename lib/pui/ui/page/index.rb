# frozen_string_literal: true

module PUI
  module UI
    module Page
      class Index < Base
        private attr_reader :model, :records, :pagination_metadata, :q, :menu_items

        with_options to: :model, private: true do
          delegate :model_name_human
          delegate :model_name_human_plural
        end

        def initialize(model:, records:, pagination_metadata:, q:, menu_items:)
          @model = model
          @records = records
          @columns = []
          @pagination_metadata = pagination_metadata
          @q = q
          @menu_items = menu_items
        end

        def view_template
          div(class: 'container mx-auto') do
            div(class: 'flex justify-between items-center mb-6') do
              h1(class: 'text-primary text-2xl font-bold') { model_name_human_plural }

              new_record_button(model, params: pagination_metadata.params)
            end

            records_list

            div(id: 'record')
          end
        end

        private

        def layout = raise NotImplementedError
        def layout_params = { page_title:, menu_items: }
        def page_title = model_name_human
        def records_list = raise NotImplementedError
      end
    end
  end
end
