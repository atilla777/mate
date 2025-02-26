# frozen_string_literal: true

module Scan
  module Views
    module Config
      class Records < PUI::UI::View::Records
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
end
