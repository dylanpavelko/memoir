require 'test_helper'

class UserHasViewingPrivilegesControllerTest < ActionController::TestCase
  setup do
    @user_has_viewing_privilege = user_has_viewing_privileges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_has_viewing_privileges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_has_viewing_privilege" do
    assert_difference('UserHasViewingPrivilege.count') do
      post :create, user_has_viewing_privilege: { user_id: @user_has_viewing_privilege.user_id, viewingPrivilege_id: @user_has_viewing_privilege.viewingPrivilege_id }
    end

    assert_redirected_to user_has_viewing_privilege_path(assigns(:user_has_viewing_privilege))
  end

  test "should show user_has_viewing_privilege" do
    get :show, id: @user_has_viewing_privilege
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_has_viewing_privilege
    assert_response :success
  end

  test "should update user_has_viewing_privilege" do
    patch :update, id: @user_has_viewing_privilege, user_has_viewing_privilege: { user_id: @user_has_viewing_privilege.user_id, viewingPrivilege_id: @user_has_viewing_privilege.viewingPrivilege_id }
    assert_redirected_to user_has_viewing_privilege_path(assigns(:user_has_viewing_privilege))
  end

  test "should destroy user_has_viewing_privilege" do
    assert_difference('UserHasViewingPrivilege.count', -1) do
      delete :destroy, id: @user_has_viewing_privilege
    end

    assert_redirected_to user_has_viewing_privileges_path
  end
end
