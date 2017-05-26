# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :enrollment do
    curriculum nil
    student nil
    grade 50
  end
end
