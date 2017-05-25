require "rails_helper.rb"

RSpec.feature "Admin can edit students information" do
  let!(:curriculum) { FactoryGirl.create :curriculum }

  before do
    visit "/"
    click_link "Curriculum"

    click_link "Japanese"
    click_link "Edit curriculum"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "English"
    fill_in "Duration", with: "10"

    click_button "Update Curriculum"

    expect(page).to have_content "Curriculum has been updated successfully!"
    expect(page.current_url).to eq curriculum_url(curriculum)
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    fill_in "Duration", with: "Kentang"

    click_button "Update Curriculum"
    expect(page).to have_content "Curriculum has not been updated."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Duration is not a number"
  end
end
