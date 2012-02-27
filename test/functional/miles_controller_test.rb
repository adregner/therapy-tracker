require 'test_helper'

class MilesControllerTest < ActionController::TestCase
  setup do
    @mile = miles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:miles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mile" do
    assert_difference('Mile.count') do
      post :create, mile: @mile.attributes
    end

    assert_redirected_to mile_path(assigns(:mile))
  end

  test "should show mile" do
    get :show, id: @mile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mile
    assert_response :success
  end

  test "should update mile" do
    put :update, id: @mile, mile: @mile.attributes
    assert_redirected_to mile_path(assigns(:mile))
  end

  test "should destroy mile" do
    assert_difference('Mile.count', -1) do
      delete :destroy, id: @mile
    end

    assert_redirected_to miles_path
  end
end
