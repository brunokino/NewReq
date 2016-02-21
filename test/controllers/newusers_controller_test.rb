require 'test_helper'

class NewusersControllerTest < ActionController::TestCase
  setup do
    @newuser = newusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newuser" do
    assert_difference('Newuser.count') do
      post :create, newuser: { City: @newuser.City, Country: @newuser.Country, Office: @newuser.Office, State: @newuser.State, address: @newuser.address, company_id: @newuser.company_id, department: @newuser.department, description: @newuser.description, firstname: @newuser.firstname, grant_id: @newuser.grant_id, homephone: @newuser.homephone, ipphone: @newuser.ipphone, lastname: @newuser.lastname, mobile: @newuser.mobile, pager: @newuser.pager, phone: @newuser.phone, pobox: @newuser.pobox, postalcode: @newuser.postalcode, site_id: @newuser.site_id, title: @newuser.title, username: @newuser.username, website: @newuser.website }
    end

    assert_redirected_to newuser_path(assigns(:newuser))
  end

  test "should show newuser" do
    get :show, id: @newuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newuser
    assert_response :success
  end

  test "should update newuser" do
    patch :update, id: @newuser, newuser: { City: @newuser.City, Country: @newuser.Country, Office: @newuser.Office, State: @newuser.State, address: @newuser.address, company_id: @newuser.company_id, department: @newuser.department, description: @newuser.description, firstname: @newuser.firstname, grant_id: @newuser.grant_id, homephone: @newuser.homephone, ipphone: @newuser.ipphone, lastname: @newuser.lastname, mobile: @newuser.mobile, pager: @newuser.pager, phone: @newuser.phone, pobox: @newuser.pobox, postalcode: @newuser.postalcode, site_id: @newuser.site_id, title: @newuser.title, username: @newuser.username, website: @newuser.website }
    assert_redirected_to newuser_path(assigns(:newuser))
  end

  test "should destroy newuser" do
    assert_difference('Newuser.count', -1) do
      delete :destroy, id: @newuser
    end

    assert_redirected_to newusers_path
  end
end
