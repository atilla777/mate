class CreateScanResults < ActiveRecord::Migration[8.0]
  def change
    create_table :scan_results do |t|
      t.references :task, null: false, foreign_key: { to_table: :scan_tasks }
      t.string :host
      t.integer :port
      t.string :protocol
      t.string :state
      t.string :service

      t.timestamps
    end
  end
end
