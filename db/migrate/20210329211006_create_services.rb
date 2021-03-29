class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.string :category_directory
      t.string :description
      t.string :value
      t.integer :quantity_of_service
      t.references :users, null: false,foreign_key: { to_table: :users }
      t.timestamps      
    end
  end
end
