require 'test_helper'

class GroupHasCharactersControllerTest < ActionController::TestCase
  setup do
    @group_has_character = group_has_characters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_has_characters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_has_character" do
    assert_difference('GroupHasCharacter.count') do
      post :create, group_has_character: { characterTag_id: @group_has_character.characterTag_id, group_id: @group_has_character.group_id }
    end

    assert_redirected_to group_has_character_path(assigns(:group_has_character))
  end

  test "should show group_has_character" do
    get :show, id: @group_has_character
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_has_character
    assert_response :success
  end

  test "should update group_has_character" do
    patch :update, id: @group_has_character, group_has_character: { characterTag_id: @group_has_character.characterTag_id, group_id: @group_has_character.group_id }
    assert_redirected_to group_has_character_path(assigns(:group_has_character))
  end

  test "should destroy group_has_character" do
    assert_difference('GroupHasCharacter.count', -1) do
      delete :destroy, id: @group_has_character
    end

    assert_redirected_to group_has_characters_path
  end
end
