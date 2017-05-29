require "rails_helper"

RSpec.feature "Admin can view enrolled students in a class" do
  let!(:curriculum) { FactoryGirl.create :curriculum, name: "Bertapa Melayang" }
  let!(:student) { FactoryGirl.create :student, name: "Adum" }
  let!(:student2) { FactoryGirl.create :student, name: "Kentang" }
  let!(:enrollment) { FactoryGirl.create :enrollment, curriculum: curriculum, student: student }

  scenario "Adum is viewed on class info" do
    visit curriculum_enrollments_path(curriculum)

    within("#enrolled") do
      click_link("Dismiss student")
    end

    expect(page).to have_content "The student has been dismissed."

    page.find("#not-enrolled").should have_content "Adum"
  end
end
