class Enrollment < ApplicationRecord
  belongs_to :curriculum
  belongs_to :student
end
