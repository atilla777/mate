class CreateUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :units do |t|
      t.string :name
      t.integer :type
      t.text :description

      t.timestamps
    end
  end
end
