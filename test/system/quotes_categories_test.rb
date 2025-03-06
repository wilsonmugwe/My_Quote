require "application_system_test_case"

class QuotesCategoriesTest < ApplicationSystemTestCase
  setup do
    @quotes_category = quotes_categories(:one)
  end

  test "visiting the index" do
    visit quotes_categories_url
    assert_selector "h1", text: "Quotes categories"
  end

  test "should create quotes category" do
    visit quotes_categories_url
    click_on "New quotes category"

    fill_in "Category", with: @quotes_category.category_id
    fill_in "Quote", with: @quotes_category.quote_id
    click_on "Create Quotes category"

    assert_text "Quotes category was successfully created"
    click_on "Back"
  end

  test "should update Quotes category" do
    visit quotes_category_url(@quotes_category)
    click_on "Edit this quotes category", match: :first

    fill_in "Category", with: @quotes_category.category_id
    fill_in "Quote", with: @quotes_category.quote_id
    click_on "Update Quotes category"

    assert_text "Quotes category was successfully updated"
    click_on "Back"
  end

  test "should destroy Quotes category" do
    visit quotes_category_url(@quotes_category)
    click_on "Destroy this quotes category", match: :first

    assert_text "Quotes category was successfully destroyed"
  end
end
