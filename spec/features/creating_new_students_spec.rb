require "rails_helper.rb"

RSpec.feature "Admin can add students" do
  before do
    visit "/"
    click_link "Students"
    click_link "Register new student"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Joe"
    fill_in "Date of birth", with: "11-Nov-1993"
    fill_in "Phone number", with: "08123456789"

    click_button "Register student"

    expect(page).to have_content "The student is successfully registered!"
  end

  scenario "click straight away" do
    click_button "Register student"

    expect(page).to have_content "The student is not registered."
    expect(page).to have_content "Name can't be blank"
  end
end
