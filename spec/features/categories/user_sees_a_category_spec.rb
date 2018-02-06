require 'rails_helper'

describe "User sees an existing category" do
  scenario "a user sees a category" do
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
    visit "/categories/#{category.id}"

    expect(page).to have_content("Da Category")
    expect(page).to have_content("HR")
    expect(page).to have_content("back")  
  end
end
