require 'test_helper'

class Admin::ProductsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_products)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_product
    assert_difference('Admin::Product.count') do
      post :create, :product => { }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  def test_should_show_product
    get :show, :id => admin_products(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => admin_products(:one).id
    assert_response :success
  end

  def test_should_update_product
    put :update, :id => admin_products(:one).id, :product => { }
    assert_redirected_to product_path(assigns(:product))
  end

  def test_should_destroy_product
    assert_difference('Admin::Product.count', -1) do
      delete :destroy, :id => admin_products(:one).id
    end

    assert_redirected_to admin_products_path
  end
end
