require 'rails_helper'

describe "User edits existing job" do
  scenario "a user edits a job" do
    company = Company.create!(name: "ESPN") 
    job = Job.create!(
                      title: "Developer",
                      description: "So much fun!",
                      level_of_interest: 80,
                      city: "Denver",
                      company_id: company.id
                      ) 

    visit "/companies/#{company.id}/jobs/#{job.id}/edit"

    expect(current_path).to eq(edit_company_job_path(company, job))
    
    fill_in "job[title]", with: "CEO"
    fill_in "job[description]", with: "Your all beneath me!"
    fill_in "job[level_of_interest]", with: 100

    click_button "Update"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("CEO")
    expect(page).to have_content("Your all beneath me!")
  end
end
