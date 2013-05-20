require 'test_helper'

class TryesControllerTest < ActionController::TestCase
  setup do
    @trye = tryes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tryes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trye" do
    assert_difference('Trye.count') do
      post :create, trye: { code: @trye.code, match: @trye.match, team_id: @trye.team_id }
    end

    assert_redirected_to trye_path(assigns(:trye))
  end

  test "should show trye" do
    get :show, id: @trye
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trye
    assert_response :success
  end

  test "should update trye" do
    put :update, id: @trye, trye: { code: @trye.code, match: @trye.match, team_id: @trye.team_id }
    assert_redirected_to trye_path(assigns(:trye))
  end

  test "should destroy trye" do
    assert_difference('Trye.count', -1) do
      delete :destroy, id: @trye
    end

    assert_redirected_to tryes_path
  end
end
