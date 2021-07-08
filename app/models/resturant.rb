class Resturant < ApplicationRecord
  validates_uniqueness_of :name

  def as_json(opt={})
    basic_attribute = self.slice(:id, :name, :specility, :location)
    return basic_attribute
  end
end
