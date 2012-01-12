require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
  	get :index
  	assert_response :success
  end

  test "should get about" do
  	get :about
  	assert_response :success
  end
end
