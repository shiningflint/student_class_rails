require 'rails_helper'

RSpec.feature "Admin can view students" do
  let!(:student) { FactoryGirl.create(:student, name: "Adum") }

  scenario "View the student details" do
    visit "/"
    click_link "Students"

    expect(page).to have_content "Adum"
    click_link "Adum"

    expect(page.current_url).to eq student_url(student)

    within("#student-title") do
      expect(page).to have_content "Hi, Adum!"
    end
  end
end
