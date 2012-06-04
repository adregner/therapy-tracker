class InvoicesController < ApplicationController
  before_filter :all_sub_objects,  :only => [:edit, :with, :copy, :update, :new]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])
    @visits = Visit.where(:invoice_id => @invoice.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new
    @visits = Visit.where(:invoice_id => nil)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
    @visits = Visit.where(:invoice_id => @invoice.id)
  end

  # POST /invoices
  # POST /invoices.json
  def create
    params[:all] = Hash[params[:invoice]]
    params[:invoice].delete_if {|key, value| key.include? "visit" }
    
    @invoice = Invoice.new(params[:invoice])
    
    respond_to do |format|
      if @invoice.save
        create_visits
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create_visits
    args = params[:all]
    n = args["max_visit_n"].to_i
    
    while n >= 0 do
      if args.has_key?("visit_id_"+n.to_s)
        visit = Visit.find(args["visit_id_"+n.to_s])
        visit.invoice_id = @invoice.id
        visit.save
      end
      n -= 1
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    
    @invoice.visits.each do |visit|
      visit.invoice_id = nil
      visit.save
    end
    
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private

    def all_sub_objects
      @companies = Company.find(:all, :order => "name")
    end
end
