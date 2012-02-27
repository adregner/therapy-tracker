class MilesController < ApplicationController
  # GET /miles
  # GET /miles.json
  def index
    @miles = Mile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @miles }
    end
  end

  # GET /miles/1
  # GET /miles/1.json
  def show
    @mile = Mile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mile }
    end
  end

  # GET /miles/new
  # GET /miles/new.json
  def new
    @mile = Mile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mile }
    end
  end

  # GET /miles/1/edit
  def edit
    @mile = Mile.find(params[:id])
  end

  # POST /miles
  # POST /miles.json
  def create
    @mile = Mile.new(params[:mile])

    respond_to do |format|
      if @mile.save
        format.html { redirect_to @mile, notice: 'Mile was successfully created.' }
        format.json { render json: @mile, status: :created, location: @mile }
      else
        format.html { render action: "new" }
        format.json { render json: @mile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /miles/1
  # PUT /miles/1.json
  def update
    @mile = Mile.find(params[:id])

    respond_to do |format|
      if @mile.update_attributes(params[:mile])
        format.html { redirect_to @mile, notice: 'Mile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miles/1
  # DELETE /miles/1.json
  def destroy
    @mile = Mile.find(params[:id])
    @mile.destroy

    respond_to do |format|
      format.html { redirect_to miles_url }
      format.json { head :no_content }
    end
  end
end
