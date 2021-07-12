class Opinion < ApplicationRecord
    belongs_to :resturant, optional: true
    belongs_to :dish, optional: true

    validates :user_id, presence: true
    validates :resturant_id, presence: true
    validates :review, presence: true
end
