require 'test_helper'

class UserHasViewingPreferencesControllerTest < ActionController::TestCase
  setup do
    @user_has_viewing_preference = user_has_viewing_preferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_has_viewing_preferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_has_viewing_preference" do
    assert_difference('UserHasViewingPreference.count') do
      post :create, user_has_viewing_preference: { user_id: @user_has_viewing_preference.user_id, viewingPreference_id: @user_has_viewing_preference.viewingPreference_id }
    end

    assert_redirected_to user_has_viewing_preference_path(assigns(:user_has_viewing_preference))
  end

  test "should show user_has_viewing_preference" do
    get :show, id: @user_has_viewing_preference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_has_viewing_preference
    assert_response :success
  end

  test "should update user_has_viewing_preference" do
    patch :update, id: @user_has_viewing_preference, user_has_viewing_preference: { user_id: @user_has_viewing_preference.user_id, viewingPreference_id: @user_has_viewing_preference.viewingPreference_id }
    assert_redirected_to user_has_viewing_preference_path(assigns(:user_has_viewing_preference))
  end

  test "should destroy user_has_viewing_preference" do
    assert_difference('UserHasViewingPreference.count', -1) do
      delete :destroy, id: @user_has_viewing_preference
    end

    assert_redirected_to user_has_viewing_preferences_path
  end
end
