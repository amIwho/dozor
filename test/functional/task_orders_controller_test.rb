require 'test_helper'

class TaskOrdersControllerTest < ActionController::TestCase
  setup do
    @task_order = task_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_order" do
    assert_difference('TaskOrder.count') do
      post :create, task_order: { dropped: @task_order.dropped, game_id: @task_order.game_id, order_n: @task_order.order_n, solve_time: @task_order.solve_time, solved: @task_order.solved, task_id: @task_order.task_id, team_id: @task_order.team_id, time_hint1: @task_order.time_hint1, time_hint2: @task_order.time_hint2, time_start: @task_order.time_start }
    end

    assert_redirected_to task_order_path(assigns(:task_order))
  end

  test "should show task_order" do
    get :show, id: @task_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_order
    assert_response :success
  end

  test "should update task_order" do
    put :update, id: @task_order, task_order: { dropped: @task_order.dropped, game_id: @task_order.game_id, order_n: @task_order.order_n, solve_time: @task_order.solve_time, solved: @task_order.solved, task_id: @task_order.task_id, team_id: @task_order.team_id, time_hint1: @task_order.time_hint1, time_hint2: @task_order.time_hint2, time_start: @task_order.time_start }
    assert_redirected_to task_order_path(assigns(:task_order))
  end

  test "should destroy task_order" do
    assert_difference('TaskOrder.count', -1) do
      delete :destroy, id: @task_order
    end

    assert_redirected_to task_orders_path
  end
end
