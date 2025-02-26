class CreateScanConfigs < ActiveRecord::Migration[8.0]
  def change
    create_table :scan_configs do |t|
      t.string :name
      t.text :description
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
