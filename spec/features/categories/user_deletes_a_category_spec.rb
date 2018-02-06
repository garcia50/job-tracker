require 'rails_helper'

describe "User deletes a category" do
  scenario "a user deletes a catergory" do
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
    visit '/categories'

    click_on "Delete"

    expect(page).to have_content("Categories")
    # expect(Category.count).to eq(0)
    
  end
end
