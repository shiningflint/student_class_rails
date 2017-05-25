require 'rails_helper'

RSpec.feature "Admin can view curriculums" do
  let!(:curriculum) { FactoryGirl.create(:curriculum) }

  scenario "View the student details" do
    visit "/"
    click_link "Curriculums"
    click_link "Japanese"

    expect(page.current_url).to eq curriculum_url(curriculum)

    within("#curriculum-title") do
      expect(page).to have_content "Japanese Course"
    end
  end
end
