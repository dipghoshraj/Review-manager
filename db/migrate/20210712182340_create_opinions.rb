class CreateOpinions < ActiveRecord::Migration[6.1]
  def change
    create_table :opinions do |t|
      t.belongs_to :resturant
      t.belongs_to :dish

      t.string :review
      t.bigint :user_id

      t.timestamps
    end
  end
end
