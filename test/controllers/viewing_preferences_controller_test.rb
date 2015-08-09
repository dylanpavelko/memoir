require 'test_helper'

class ViewingPreferencesControllerTest < ActionController::TestCase
  setup do
    @viewing_preference = viewing_preferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:viewing_preferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create viewing_preference" do
    assert_difference('ViewingPreference.count') do
      post :create, viewing_preference: { characterTag: @viewing_preference.characterTag, endDate: @viewing_preference.endDate, imageDetailLevel: @viewing_preference.imageDetailLevel, startDate: @viewing_preference.startDate, storylineTag: @viewing_preference.storylineTag, textDetailLevel: @viewing_preference.textDetailLevel }
    end

    assert_redirected_to viewing_preference_path(assigns(:viewing_preference))
  end

  test "should show viewing_preference" do
    get :show, id: @viewing_preference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @viewing_preference
    assert_response :success
  end

  test "should update viewing_preference" do
    patch :update, id: @viewing_preference, viewing_preference: { characterTag: @viewing_preference.characterTag, endDate: @viewing_preference.endDate, imageDetailLevel: @viewing_preference.imageDetailLevel, startDate: @viewing_preference.startDate, storylineTag: @viewing_preference.storylineTag, textDetailLevel: @viewing_preference.textDetailLevel }
    assert_redirected_to viewing_preference_path(assigns(:viewing_preference))
  end

  test "should destroy viewing_preference" do
    assert_difference('ViewingPreference.count', -1) do
      delete :destroy, id: @viewing_preference
    end

    assert_redirected_to viewing_preferences_path
  end
end
