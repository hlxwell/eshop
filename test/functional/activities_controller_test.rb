require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_activity
    assert_difference('Activity.count') do
      post :create, :activity => { }
    end

    assert_redirected_to activity_path(assigns(:activity))
  end

  def test_should_show_activity
    get :show, :id => activities(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => activities(:one).id
    assert_response :success
  end

  def test_should_update_activity
    put :update, :id => activities(:one).id, :activity => { }
    assert_redirected_to activity_path(assigns(:activity))
  end

  def test_should_destroy_activity
    assert_difference('Activity.count', -1) do
      delete :destroy, :id => activities(:one).id
    end

    assert_redirected_to activities_path
  end
end
