require 'test_helper'

class GroupHasStorylinesControllerTest < ActionController::TestCase
  setup do
    @group_has_storyline = group_has_storylines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_has_storylines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_has_storyline" do
    assert_difference('GroupHasStoryline.count') do
      post :create, group_has_storyline: { group_id: @group_has_storyline.group_id, storylineTag_id: @group_has_storyline.storylineTag_id }
    end

    assert_redirected_to group_has_storyline_path(assigns(:group_has_storyline))
  end

  test "should show group_has_storyline" do
    get :show, id: @group_has_storyline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_has_storyline
    assert_response :success
  end

  test "should update group_has_storyline" do
    patch :update, id: @group_has_storyline, group_has_storyline: { group_id: @group_has_storyline.group_id, storylineTag_id: @group_has_storyline.storylineTag_id }
    assert_redirected_to group_has_storyline_path(assigns(:group_has_storyline))
  end

  test "should destroy group_has_storyline" do
    assert_difference('GroupHasStoryline.count', -1) do
      delete :destroy, id: @group_has_storyline
    end

    assert_redirected_to group_has_storylines_path
  end
end
