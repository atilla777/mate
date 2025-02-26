class CreateScanConfigHostsRanges < ActiveRecord::Migration[8.0]
  def change
    create_table :scan_config_hosts_ranges do |t|
      t.references :config, null: false, foreign_key: { to_table: :scan_configs }
      t.integer :start
      t.integer :finish
      t.text :description

      t.timestamps
    end
  end
end
