require 'test_helper'

class Web::PathsControllerTest < ActionController::TestCase
  setup do
    @path = paths(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:paths)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create path' do
    assert_difference('Path.count') do
      post :create, path: { creator_id: @path.creator_id, description: @path.description, name: @path.name }
    end

    assert_redirected_to path_path(assigns(:path))
  end

  test 'should show path' do
    get :show, id: @path
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @path
    assert_response :success
  end

  test 'should update path' do
    patch :update, id: @path, path: { creator_id: @path.creator_id, description: @path.description, name: @path.name }
    assert_redirected_to path_path(assigns(:path))
  end

  test 'should destroy path' do
    assert_difference('Path.count', -1) do
      delete :destroy, id: @path
    end

    assert_redirected_to paths_path
  end
end
