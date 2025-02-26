class CreateScanTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :scan_tasks do |t|
      t.references :config, null: false, foreign_key: { to_table: :scan_configs }
      t.integer :status
      t.string :job_id
      t.integer :process_id

      t.timestamps
    end
  end
end
