require 'test_helper'

class ErasControllerTest < ActionController::TestCase
  setup do
    @era = eras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create era" do
    assert_difference('Era.count') do
      post :create, era: { endDate: @era.endDate, name: @era.name, startDate: @era.startDate }
    end

    assert_redirected_to era_path(assigns(:era))
  end

  test "should show era" do
    get :show, id: @era
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @era
    assert_response :success
  end

  test "should update era" do
    patch :update, id: @era, era: { endDate: @era.endDate, name: @era.name, startDate: @era.startDate }
    assert_redirected_to era_path(assigns(:era))
  end

  test "should destroy era" do
    assert_difference('Era.count', -1) do
      delete :destroy, id: @era
    end

    assert_redirected_to eras_path
  end
end
