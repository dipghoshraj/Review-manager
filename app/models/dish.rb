class Dish < ApplicationRecord
    belongs_to :resturant
    has_many :opinions, dependent: :destroy


    validates :resturant_id, presence: true
    validates :name, presence: true
end