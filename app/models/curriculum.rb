class Curriculum < ApplicationRecord
  validates :name, presence: true
  validates :duration, numericality: { only_integer: true }

  has_many :enrollments
  has_many :students, through: :enrollments
end
