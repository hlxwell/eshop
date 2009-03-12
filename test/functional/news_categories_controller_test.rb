require 'test_helper'

class NewsCategoriesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:news_categories)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_news_category
    assert_difference('NewsCategory.count') do
      post :create, :news_category => { }
    end

    assert_redirected_to news_category_path(assigns(:news_category))
  end

  def test_should_show_news_category
    get :show, :id => news_categories(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => news_categories(:one).id
    assert_response :success
  end

  def test_should_update_news_category
    put :update, :id => news_categories(:one).id, :news_category => { }
    assert_redirected_to news_category_path(assigns(:news_category))
  end

  def test_should_destroy_news_category
    assert_difference('NewsCategory.count', -1) do
      delete :destroy, :id => news_categories(:one).id
    end

    assert_redirected_to news_categories_path
  end
end
