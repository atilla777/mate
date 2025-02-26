class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :kind
      t.text :description

      t.timestamps
    end
  end
end
