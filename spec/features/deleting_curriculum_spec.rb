require 'rails_helper'

RSpec.feature "Admin can delete student records" do
  let!(:curriculum) { FactoryGirl.create :curriculum }

  scenario "Deleting the student" do
    visit "/"
    click_link "Curriculum"
    click_link "Japanese"
    click_link "Delete curriculum"
    expect(page).to have_content "Curriculum record has been deleted successfully."
    expect(page).to_not have_content "Japanese"
  end
end
