class CreateResturants < ActiveRecord::Migration[6.1]
  def change
    create_table :resturants do |t|

      t.timestamps
    end
  end
end
