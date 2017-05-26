require "rails_helper"

RSpec.feature "Admin can view enrolled students in a class" do
  let!(:curriculum) { FactoryGirl.create :curriculum, name: "Bertapa Melayang" }
  let!(:student) { FactoryGirl.create :student, name: "Adum" }
  let!(:student2) { FactoryGirl.create :student, name: "Kentang" }
  let!(:enrollment) { FactoryGirl.create :enrollment, curriculum: curriculum, student: student }

  scenario "Adum is viewed on class info" do
    visit curriculum_path(curriculum)

    expect(page).to have_content "Adum"
    expect(page).to_not have_content "Kentang"
  end
end
