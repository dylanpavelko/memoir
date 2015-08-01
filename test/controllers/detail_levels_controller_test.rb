require 'test_helper'

class DetailLevelsControllerTest < ActionController::TestCase
  setup do
    @detail_level = detail_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detail_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail_level" do
    assert_difference('DetailLevel.count') do
      post :create, detail_level: { name: @detail_level.name }
    end

    assert_redirected_to detail_level_path(assigns(:detail_level))
  end

  test "should show detail_level" do
    get :show, id: @detail_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail_level
    assert_response :success
  end

  test "should update detail_level" do
    patch :update, id: @detail_level, detail_level: { name: @detail_level.name }
    assert_redirected_to detail_level_path(assigns(:detail_level))
  end

  test "should destroy detail_level" do
    assert_difference('DetailLevel.count', -1) do
      delete :destroy, id: @detail_level
    end

    assert_redirected_to detail_levels_path
  end
end
