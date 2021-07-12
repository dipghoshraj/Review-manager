class Resturant < ApplicationRecord
  has_many :dishs, dependent: :destroy
  has_many :opinions, dependent: :destroy

  validates :name, presence: true
  validates :specility, presence: true



  def as_json(opt={})
    basic_attribute = self.slice(:id, :name, :specility, :location)

    basic_attribute.merge!(dishs: self.dishs)
    return basic_attribute
  end
end
