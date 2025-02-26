# frozen_string_literal: true

module Component
  module Unit
    class Records < PUI::UI::Page::TableRecords
      column :id
      column :name
      column :description

      filter :id, :id_eq
      filter :name, :name_cont
      filter :description, :description_cont

      sort :id
      sort :name
    end
  end
end
