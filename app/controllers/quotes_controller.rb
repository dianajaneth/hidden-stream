#encoding: UTF-8
class QuotesController < ApplicationController
  before_filter :authenticate_user!
#  authorize_resource

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.order('created_at DESC')
    @quote = Quote.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quotes }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote = Quote.find(params[:id])

    #if params[:q] exists then add a filter of quote_id
    params[:q][:quote_id_eq] = @quote.id if params[:q]
    search_params = params[:q] ? params[:q] : {:quote_id_eq => @quote.id}

    @search = UseCase.search(search_params)
    @use_cases  = @search.result(distinct: true)

    respond_to do |format|
      format.xlsx
      format.html # show.html.erb
      format.json { render json: @quote }
      format.csv do
        quotes_csv = CSV.generate(encoding: 'UTF-8') do |csv|
          #heading
          csv << ['Nombre', 'Descripción', 'Horas en diseño', 'Horas en programación', 'Importancia', 'Tipo']
          @use_cases.each do |q|

            csv << [q.name, q.description, q.design_time, q.programming_time, "Extra", "Funcionalidad"]  if q.is_extra == true and q.is_feature == true
            csv << [q.name, q.description, q.design_time, q.programming_time, "Base", "Configuracion"]  if q.is_extra == false and q.is_feature == false
            csv << [q.name, q.description, q.design_time, q.programming_time, "Extra", "Configuracion"]  if q.is_extra == true and q.is_feature == false
            csv << [q.name, q.description, q.design_time, q.programming_time, "Base", "Funcionalidad"]  if q.is_extra == false and q.is_feature == true
          end
        end
        filename = "#{@quote.name}-Casos de uso.csv"
        send_data quotes_csv, disposition: "attachment;filename=#{filename}"
      end
    end
  end

  # GET /quotes/new
  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(params[:quote])
    @quote.user_id = current_user.id

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render json: @quote, status: :created, location: @quote }
      else
          @quotes = Quote.all
        format.html { render action: "index" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.json
  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.json { head :no_content }
    end
  end
end
