require "rails_helper.rb"

RSpec.feature "Admin can edit students information" do
  let!(:student) { FactoryGirl.create :student }

  before do
    visit "/"
    click_link "Students"

    click_link "Adum"
    click_link "Edit student information"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Kiras Dawn"
    fill_in "Date of birth", with: "23-May-1956"
    fill_in "Phone number", with: "050123456"

    click_button "Update Student"

    expect(page).to have_content "The student information has been updated!"
    expect(page.current_url).to eq student_url(student)
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""

    click_button "Update Student"
    expect(page).to have_content "Student has not been updated"
    expect(page).to have_content "Name can't be blank"
  end
end
