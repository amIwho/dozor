class TaskOrdersController < ApplicationController
  # GET /task_orders
  # GET /task_orders.json
  def index
	@current_game = Game.where(current: 1).first
    @task_orders = TaskOrder.where(game_id: @current_game)
	@teams = Team.where(confirm: true)
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_orders }
    end
  end

  # GET /task_orders/1
  # GET /task_orders/1.json
  def show
    @task_order = TaskOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_order }
    end
  end

  # GET /task_orders/new
  # GET /task_orders/new.json
  def new
    @task_order = TaskOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_order }
    end
  end

  # GET /task_orders/1/edit
  def edit
    @task_order = TaskOrder.find(params[:id])
  end

  # POST /task_orders
  # POST /task_orders.json
  def create
    @task_order = TaskOrder.new(params[:task_order])

    respond_to do |format|
      if @task_order.save
        format.html { redirect_to @task_order, notice: 'Task order was successfully created.' }
        format.json { render json: @task_order, status: :created, location: @task_order }
      else
        format.html { render action: "new" }
        format.json { render json: @task_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_orders/1
  # PUT /task_orders/1.json
  def update
    @task_order = TaskOrder.find(params[:id])

    respond_to do |format|
      if @task_order.update_attributes(params[:task_order])
        format.html { redirect_to task_orders_path, notice: 'Task order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_orders/1
  # DELETE /task_orders/1.json
  def destroy
    @task_order = TaskOrder.find(params[:id])
    @task_order.destroy

    respond_to do |format|
      format.html { redirect_to task_orders_url }
      format.json { head :no_content }
    end
  end

  def change_order
    @current_game = Game.where(current: 1).first
    @task_orders = TaskOrder.where(game_id: @current_game)
    @teams = Team.where(confirm: true)
	
    if params[:order_n]
      params[:order_n].each do |id, order_n|
        
        @task_order = TaskOrder.find(id)
        
        @task_order.update_attributes(order_n: order_n)

      end
    end
  end

  def up
    # TODO: Move row lower
  end


  
end
