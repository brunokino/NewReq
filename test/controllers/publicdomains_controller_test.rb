require 'test_helper'

class PublicdomainsControllerTest < ActionController::TestCase
  setup do
    @publicdomain = publicdomains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publicdomains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publicdomain" do
    assert_difference('Publicdomain.count') do
      post :create, publicdomain: { domain: @publicdomain.domain }
    end

    assert_redirected_to publicdomain_path(assigns(:publicdomain))
  end

  test "should show publicdomain" do
    get :show, id: @publicdomain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publicdomain
    assert_response :success
  end

  test "should update publicdomain" do
    patch :update, id: @publicdomain, publicdomain: { domain: @publicdomain.domain }
    assert_redirected_to publicdomain_path(assigns(:publicdomain))
  end

  test "should destroy publicdomain" do
    assert_difference('Publicdomain.count', -1) do
      delete :destroy, id: @publicdomain
    end

    assert_redirected_to publicdomains_path
  end
end
