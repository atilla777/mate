# frozen_string_literal: true

module Component
  module User
    class Records < PUI::UI::Page::ListRecords
      column :id
      column :description, :cell

      filter :id, :id_eq
      filter :name, :name_cont
      filter :description, :description_cont

      sort :id
      sort :name
    end
  end
end
