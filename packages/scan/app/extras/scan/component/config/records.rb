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

        private

        def actions(record)
          button_to(
            scan.tasks_path(config_id: record.id),
            class: 'btn btn-circle btn-ghost tooltip scale-0 group-hover:scale-100',
            method: :post,
            data: { tip: I18n.t('scan.ui.button.scan') }
          ) { icon_play }

          super
        end
      end
    end
  end
end
