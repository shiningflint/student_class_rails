require 'rails_helper'

RSpec.feature "Admin can delete student records" do
  let!(:student) { FactoryGirl.create :student }

  scenario "Deleting the student" do
    visit "/"
    click_link "Students"
    click_link "Adum"
    click_link "Delete Student"
    expect(page).to have_content "Student record has been deleted successfully."
    expect(page).to_not have_content "Adum"
  end
end
