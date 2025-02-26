# frozen_string_literal: true

module Scan
  module Component
    module Config
      class Records < PUI::UI::Page::TableRecords
        column :id
        column :name
        column :description

        filter :id, :id_eq
        filter :name, :name_cont
        filter :descrddiption, :description_cont

        sort :id
        sort :name
      end
    end
  end
end
