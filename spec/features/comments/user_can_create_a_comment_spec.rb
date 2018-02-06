require 'rails_helper'

describe "User can create a comment" do
  scenario "a user creates a comment" do
    company = Company.create!(name: "ESPN") 
    #company = create(:company)
    category = Category.create!(title: "HR")
    job = Job.create!(
                      title: "Developer",
                      description: "So much fun!",
                      level_of_interest: 80,
                      city: "Denver",
                      company_id: company.id,
                      category_id: category.id
                      )
    visit job_path(job)

    fill_in "comment[content]", with: "I fold papers all day."

    click_on "Create Comment"

    expect(page).to have_content("I fold papers all day.")
    expect(page).to have_content("Comments:")
  end
end
