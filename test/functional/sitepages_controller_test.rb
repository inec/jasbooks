require 'test_helper'

class SitepagesControllerTest < ActionController::TestCase
  setup do
    @sitepage = sitepages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sitepages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sitepage" do
    assert_difference('Sitepage.count') do
      post :create, sitepage: { content: @sitepage.content, image_url: @sitepage.image_url, maillink: @sitepage.maillink, title: @sitepage.title }
    end

    assert_redirected_to sitepage_path(assigns(:sitepage))
  end

  test "should show sitepage" do
    get :show, id: @sitepage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sitepage
    assert_response :success
  end

  test "should update sitepage" do
    put :update, id: @sitepage, sitepage: { content: @sitepage.content, image_url: @sitepage.image_url, maillink: @sitepage.maillink, title: @sitepage.title }
    assert_redirected_to sitepage_path(assigns(:sitepage))
  end

  test "should destroy sitepage" do
    assert_difference('Sitepage.count', -1) do
      delete :destroy, id: @sitepage
    end

    assert_redirected_to sitepages_path
  end
end
