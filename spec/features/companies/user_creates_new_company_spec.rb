require 'rails_helper'

describe "User creates a new company" do
  scenario "a user can create a new company" do
    visit "/companies/new"

    fill_in "company[name]", with: "ESPN"
    click_button "Create Company"

    expect(current_path).to eq(companies_path)
    expect(page).to have_content("ESPN")
  end
end
