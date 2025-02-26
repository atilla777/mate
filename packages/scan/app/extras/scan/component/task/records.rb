# frozen_string_literal: true

module Scan
  module Component
    module Task
      class Records < PUI::UI::Page::TableRecords
        column :id
        column :status
        column :job_id
        column :process_id

        filter :id, :id_eq
        filter :status, :status_cont
        filter :job_id, :job_id_cont
        filter :process_id, :process_id_cont

        sort :id
        sort :status

        private

        def skip_edit? = true
      end
    end
  end
end
