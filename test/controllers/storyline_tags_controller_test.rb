require 'test_helper'

class StorylineTagsControllerTest < ActionController::TestCase
  setup do
    @storyline_tag = storyline_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storyline_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storyline_tag" do
    assert_difference('StorylineTag.count') do
      post :create, storyline_tag: { name: @storyline_tag.name }
    end

    assert_redirected_to storyline_tag_path(assigns(:storyline_tag))
  end

  test "should show storyline_tag" do
    get :show, id: @storyline_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storyline_tag
    assert_response :success
  end

  test "should update storyline_tag" do
    patch :update, id: @storyline_tag, storyline_tag: { name: @storyline_tag.name }
    assert_redirected_to storyline_tag_path(assigns(:storyline_tag))
  end

  test "should destroy storyline_tag" do
    assert_difference('StorylineTag.count', -1) do
      delete :destroy, id: @storyline_tag
    end

    assert_redirected_to storyline_tags_path
  end
end
