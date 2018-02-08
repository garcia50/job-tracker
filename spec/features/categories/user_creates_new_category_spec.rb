require 'rails_helper'

describe "User can create a new category" do
  scenario "user creates new category" do
    visit '/categories'

    click_on "Add New Category"

    expect(current_path).to eq(new_category_path)

    fill_in "category[title]", with: "Sales Ninja"

    click_on "Create Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Sales Ninja")
  end
end
