class Student < ApplicationRecord
  validates :name, presence: true

  has_many :enrollments
  has_many :curriculums, through: :enrollments
end
