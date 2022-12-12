class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :make
      t.integer :year
      t.string :category
      t.text :description
      t.integer :price
      t.boolean :availability
      t.references :user, null: false, foreign_key: true
      t.string :tranmission
      t.string :colour

      t.timestamps
    end
  end
end
