require 'rails_helper'

describe "User edits existing job" do
  scenario "a user edits a job" do  
    company = Company.create!(name: "Smash Burgers")
    category = Category.create!(title: "HR")
    job = Job.create!(
                      title: "Burger Manager",
                      description: "So much food!",
                      level_of_interest: 20,
                      city: "Denver",
                      company_id: company.id,
                      category_id: category.id
                      )

    visit "/jobs/#{job.id}"

    within(".company_#{company.id}") do
      click_link "Delete"
    end
    
    expect(current_path).to eq(company_jobs_path(company))
    expect(page).not_to have_content("Burger Manger")
    expect(page).not_to have_content("So much food!")
  end
end
