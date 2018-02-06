require 'rails_helper'

describe "User edits existing job" do
  scenario "a user edits a job" do
    company = Company.create!(name: "ESPN") 
    category = Category.create!(title: "HR")
    job = Job.create!(
                      title: "Developer",
                      description: "So much fun!",
                      level_of_interest: 80,
                      city: "Denver",
                      company_id: company.id,
                      category_id: category.id
                      ) 
    visit "/categories/#{category.id}/edit"

    fill_in "category[title]", with: "Paper Folder"

    click_on "Update Category"

    expect(page).to have_content("Categories")
    expect(page).to have_content("Paper Folder")
  end
end
