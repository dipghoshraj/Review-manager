class Resturant < ApplicationRecord
  validates_uniqueness_of :name
  has_many :dishs, dependent: :destroy
  has_many :opinions, dependent: :destroy


  def as_json(opt={})
    basic_attribute = self.slice(:id, :name, :specility, :location)

    basic_attribute.merge!(dishs: self.dishs)
    return basic_attribute
  end
end
