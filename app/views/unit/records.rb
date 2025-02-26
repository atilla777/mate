# frozen_string_literal: true

module Views
  module Unit
    class Records < PUI::View::Records
      column :id
      column :description, :cell

      def search_fields(form)
        fieldset(class: 'fieldset') do
          legend(class: 'fieldset-legend') { plain 'ID' }
          raw safe(form.search_field(:id_eq, placeholder: 'ID', class: 'input w-32'))
        end

        fieldset(class: 'fieldset') do
          legend(class: 'fieldset-legend') { plain 'Name' }
          raw safe(form.search_field(:name_cont, placeholder: 'Name', class: 'input w-32'))
        end
      end
    end
  end
end
