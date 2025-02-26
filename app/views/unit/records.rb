# frozen_string_literal: true

module Views
  module Unit
    class Records < PUI::View::Records
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
