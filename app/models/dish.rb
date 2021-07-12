class Dish < ApplicationRecord
    belongs_to :resturant
    validates :resturant_id, presence: true
end