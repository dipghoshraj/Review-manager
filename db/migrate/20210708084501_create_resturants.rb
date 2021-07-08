class CreateResturants < ActiveRecord::Migration[6.1]
  def change
    create_table :resturants do |t|
      t.string :name
      t.string :specility
      t.string :location

      t.timestamps
    end
  end
end
