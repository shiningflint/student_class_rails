class Curriculum < ApplicationRecord
  validates :name, presence: true
  validates :duration, numericality: { only_integer: true }
end
