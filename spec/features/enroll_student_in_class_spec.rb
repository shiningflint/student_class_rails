require "rails_helper"

RSpec.feature "Admin can enroll students in a class" do
  let!(:curriculum) { FactoryGirl.create :curriculum, name: "Bertapa Melayang" }
  let!(:student) { FactoryGirl.create :student, name: "Adum" }

  scenario "successfully" do
    visit "/"
    click_link "Curriculums"
    click_link "Bertapa Melayang"
    click_link "Student enrollments"

    expect(page.current_url).to eq curriculum_enrollments_url(curriculum)

    expect(page).to have_content "Enroll students to Bertapa Melayang"

    within("#not-enrolled") do
      expect(page).to have_content "Adum"
      click_link "Enroll"
    end

    expect(page).to have_content "Enrollment registered successfully."

    within("#enrolled") do
      expect(page).to have_content "Adum"
    end

    within("#not-enrolled") do
      expect(page).to_not have_content "Adum"
    end
  end
end
