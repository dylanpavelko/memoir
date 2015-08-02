require 'test_helper'

class ViewingPrivilegesControllerTest < ActionController::TestCase
  setup do
    @viewing_privilege = viewing_privileges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:viewing_privileges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create viewing_privilege" do
    assert_difference('ViewingPrivilege.count') do
      post :create, viewing_privilege: { characterTag: @viewing_privilege.characterTag, endDate: @viewing_privilege.endDate, name: @viewing_privilege.name, startDate: @viewing_privilege.startDate, storylineTag: @viewing_privilege.storylineTag }
    end

    assert_redirected_to viewing_privilege_path(assigns(:viewing_privilege))
  end

  test "should show viewing_privilege" do
    get :show, id: @viewing_privilege
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @viewing_privilege
    assert_response :success
  end

  test "should update viewing_privilege" do
    patch :update, id: @viewing_privilege, viewing_privilege: { characterTag: @viewing_privilege.characterTag, endDate: @viewing_privilege.endDate, name: @viewing_privilege.name, startDate: @viewing_privilege.startDate, storylineTag: @viewing_privilege.storylineTag }
    assert_redirected_to viewing_privilege_path(assigns(:viewing_privilege))
  end

  test "should destroy viewing_privilege" do
    assert_difference('ViewingPrivilege.count', -1) do
      delete :destroy, id: @viewing_privilege
    end

    assert_redirected_to viewing_privileges_path
  end
end
