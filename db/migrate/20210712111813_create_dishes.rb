class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.belongs_to :resturant
      t.string :name

      t.timestamps
    end
  end
end
