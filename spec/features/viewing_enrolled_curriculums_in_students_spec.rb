require "rails_helper"

RSpec.feature "Admin can view enrolled students in a class" do
  let!(:curriculum) { FactoryGirl.create :curriculum, name: "Bertapa Melayang" }
  let!(:student) { FactoryGirl.create :student, name: "Adum" }
  let!(:enrollment) { FactoryGirl.create :enrollment, curriculum: curriculum, student: student }

  scenario "Adum is viewed on class info" do
    visit student_path(student)
    expect(page).to have_content "Bertapa Melayang"
  end
end
