require "rails_helper.rb"

RSpec.feature "Admin can add students" do
  scenario "with valid attributes" do
    visit "/"
    click_link "Students"
    click_link "Register new student"
    fill_in "Name", with: "Joe"
    fill_in "Date of birth", with: "11-Nov-1993"
    fill_in "Phone number", with: "08123456789"

    click_button "Register Student"

    expect(page).to have_content "The student is successfully registered!"
  end
end
