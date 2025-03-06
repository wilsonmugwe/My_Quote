require "test_helper"

class QuotesCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotes_category = quotes_categories(:one)
  end

  test "should get index" do
    get quotes_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_quotes_category_url
    assert_response :success
  end

  test "should create quotes_category" do
    assert_difference("QuotesCategory.count") do
      post quotes_categories_url, params: { quotes_category: { category_id: @quotes_category.category_id, quote_id: @quotes_category.quote_id } }
    end

    assert_redirected_to quotes_category_url(QuotesCategory.last)
  end

  test "should show quotes_category" do
    get quotes_category_url(@quotes_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_quotes_category_url(@quotes_category)
    assert_response :success
  end

  test "should update quotes_category" do
    patch quotes_category_url(@quotes_category), params: { quotes_category: { category_id: @quotes_category.category_id, quote_id: @quotes_category.quote_id } }
    assert_redirected_to quotes_category_url(@quotes_category)
  end

  test "should destroy quotes_category" do
    assert_difference("QuotesCategory.count", -1) do
      delete quotes_category_url(@quotes_category)
    end

    assert_redirected_to quotes_categories_url
  end
end
