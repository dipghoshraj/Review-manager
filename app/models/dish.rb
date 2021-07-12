class Dish < ApplicationRecord
    belongs_to :resturant
    has_many :opinions, dependent: :destroy


    validates :resturant_id, presence: true
    validates :name, presence: true

    def as_json(opt={})
        basic_attribute = self.slice(:id, :name)
    end
end