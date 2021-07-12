class Opinion < ApplicationRecord
    belongs_to :resturant, class_name: "Resturant", primary_key: 'id', foreign_key: 'resturant_id', optional: true
    belongs_to :dish, class_name: "Dish", primary_key: 'id', foreign_key: 'dish_id', optional: true

    validates :user_id, presence: true
    validates :resturant_id, presence: true
    validates :review, presence: true


  def as_json(opt={})
    basic_attribute = self.slice(:id, :review)

    basic_attribute.merge!(
        resturant: self.resturant.slice(:id, :name),
        dish: dish_attribute,
        users: user_attribute
    )

  end

  def dish_attribute
    return nil unless self.dish.present?
    basic_dish_attributes = self.dish&.slice(
      :id,
      :name
    )

    basic_dish_attributes
  end

  def user_attribute
    return nil unless self.user_id.present?
    user = User.find_by_id(self.user_id)

    basic_user_attributes = user&.slice(
        :id,
        :name,
        :email
    )
     basic_user_attributes
  end
end
