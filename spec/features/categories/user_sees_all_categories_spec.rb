require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create!(title: "HR")
    visit '/categories'

    expect(page).to have_content("Categories")
    expect(page).to have_content("HR")
    
  end
end
