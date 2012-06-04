class VisitsController < ApplicationController
  before_filter :all_sub_objects,  :only => [:edit, :with, :copy, :update, :new]
  after_filter :calculated_fields, :only => [:show, :index]

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.where(:invoice_id => nil)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visits }
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    @visit = Visit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visit }
    end
  end

  # GET /visits/new
  # GET /visits/new.json
  def new
    @visit = Visit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visit }
    end
  end

  # GET /visits/1/edit
  def edit
    @visit = Visit.find(params[:id])
  end

  # POST /visits
  # POST /visits.json
  def create
    params[:visit][:client] = Client.find(params[:visit][:client].to_i)
    @visit = Visit.new(params[:visit])

    respond_to do |format|
      if @visit.save
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
        format.json { render json: @visit, status: :created, location: @visit }
      else
        format.html { render action: "new" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.json
  def update
    params[:visit][:client] = Client.find(params[:visit][:client].to_i)
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to visits_url }
      format.json { head :no_content }
    end
  end

  private

  def all_sub_objects
    @clients_select = Client.find(:all).map{|client| [client.contact.full_name, client.id]}
    @clients_select = @clients_select.sort{|c1, c2| c1[0] <=> c2[0] }
  end

  def convert_time
  end

  def calculated_fields
    #if @visits?
    #  @visits.each{|v| }
    #else
    #  @visit = convert_time @visit
    #end
  end

end
