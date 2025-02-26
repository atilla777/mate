# frozen_string_literal: true

module PUI
  module View
    class Index < Base
      private attr_reader :model, :records

      with_options to: :model, private: true do
        delegate :model_name_human
      end

      def initialize(model:, records:)
        @model = model
        @records = records
        @columns = []
      end

      def view_template
        div(class: "container mx-auto") do
          div(class: "flex justify-between items-center mb-6") do
            h1(class: "text-primary text-2xl font-bold") { model_name_human }

            new_record_button(model)
          end

          records_list

          div(id: "record-form")
        end
      end

      def page_title = model_name_human(cont: 2)
      def layout = Layout::Application
      def records_list = raise NotImplementedError
    end
  end
end
