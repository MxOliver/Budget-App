require 'test_helper'

class BudgetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get budget_index_url
    assert_response :success
  end

  test "should get edit" do
    get budget_edit_url
    assert_response :success
  end

end
