class TryesController < ApplicationController
  # GET /tryes
  # GET /tryes.json
  def index
    @tryes = Trye.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tryes }
    end
  end

  # GET /tryes/1
  # GET /tryes/1.json
  def show
    @trye = Trye.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trye }
    end
  end

  # GET /tryes/new
  # GET /tryes/new.json
  def new
    @trye = Trye.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trye }
    end
  end

  # GET /tryes/1/edit
  def edit
    @trye = Trye.find(params[:id])
  end

  # POST /tryes
  # POST /tryes.json
  def create
    @trye = Trye.new(params[:trye])

    respond_to do |format|
      if @trye.save
        format.html { redirect_to @trye, notice: 'Trye was successfully created.' }
        format.json { render json: @trye, status: :created, location: @trye }
      else
        format.html { render action: "new" }
        format.json { render json: @trye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tryes/1
  # PUT /tryes/1.json
  def update
    @trye = Trye.find(params[:id])

    respond_to do |format|
      if @trye.update_attributes(params[:trye])
        format.html { redirect_to @trye, notice: 'Trye was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tryes/1
  # DELETE /tryes/1.json
  def destroy
    @trye = Trye.find(params[:id])
    @trye.destroy

    respond_to do |format|
      format.html { redirect_to tryes_url }
      format.json { head :no_content }
    end
  end
end
