require 'test_helper'

class CharacterTagsControllerTest < ActionController::TestCase
  setup do
    @character_tag = character_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_tag" do
    assert_difference('CharacterTag.count') do
      post :create, character_tag: { name: @character_tag.name, nickname: @character_tag.nickname, relationship: @character_tag.relationship, relationshipType_id: @character_tag.relationshipType_id }
    end

    assert_redirected_to character_tag_path(assigns(:character_tag))
  end

  test "should show character_tag" do
    get :show, id: @character_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character_tag
    assert_response :success
  end

  test "should update character_tag" do
    patch :update, id: @character_tag, character_tag: { name: @character_tag.name, nickname: @character_tag.nickname, relationship: @character_tag.relationship, relationshipType_id: @character_tag.relationshipType_id }
    assert_redirected_to character_tag_path(assigns(:character_tag))
  end

  test "should destroy character_tag" do
    assert_difference('CharacterTag.count', -1) do
      delete :destroy, id: @character_tag
    end

    assert_redirected_to character_tags_path
  end
end
