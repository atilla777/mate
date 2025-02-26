# frozen_string_literal: true

module Views
  module Unit
    class Records < PUI::View::Records
      column :id
      column :description, :cell
    end
  end
end
