require 'test_helper'

class TopsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get how_to_use" do
    get :how_to_use
    assert_response :success
  end

  test "should get q_and_a" do
    get :q_and_a
    assert_response :success
  end

  test "should get company" do
    get :company
    assert_response :success
  end

  test "should get genre" do
    get :genre
    assert_response :success
  end

  test "should get subgenre" do
    get :subgenre
    assert_response :success
  end

end
