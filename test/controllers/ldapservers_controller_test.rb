require 'test_helper'

class LdapserversControllerTest < ActionController::TestCase
  setup do
    @ldapserver = ldapservers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldapservers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldapserver" do
    assert_difference('Ldapserver.count') do
      post :create, ldapserver: { attribute: @ldapserver.attribute, base: @ldapserver.base, host: @ldapserver.host, method: @ldapserver.method, password: @ldapserver.password, port: @ldapserver.port, username: @ldapserver.username }
    end

    assert_redirected_to ldapserver_path(assigns(:ldapserver))
  end

  test "should show ldapserver" do
    get :show, id: @ldapserver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ldapserver
    assert_response :success
  end

  test "should update ldapserver" do
    patch :update, id: @ldapserver, ldapserver: { attribute: @ldapserver.attribute, base: @ldapserver.base, host: @ldapserver.host, method: @ldapserver.method, password: @ldapserver.password, port: @ldapserver.port, username: @ldapserver.username }
    assert_redirected_to ldapserver_path(assigns(:ldapserver))
  end

  test "should destroy ldapserver" do
    assert_difference('Ldapserver.count', -1) do
      delete :destroy, id: @ldapserver
    end

    assert_redirected_to ldapservers_path
  end
end
