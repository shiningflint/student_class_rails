require "rails_helper.rb"

RSpec.feature "Admin can add classes" do
  before do
    visit "/"
    click_link "Curriculums"
    click_link "Register new curriculum"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "English Beginner"
    fill_in "Duration", with: "24"

    click_button "Create Curriculum"
    expect(page).to have_content "Curriculum has been created successfully."
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    fill_in "Duration", with: "kentang bakar"

    click_button "Create Curriculum"

    expect(page).to have_content "Curriculum was not created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Duration is not a number"
  end
end
