class UseCasesController < ApplicationController
  # GET /use_cases
  # GET /use_cases.json
  def index
    @quote = Quote.find(params[:quote_id])
#    @use_cases = @quote.use_cases

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @use_cases }
    end
  end

  # GET /use_cases/1
  # GET /use_cases/1.json
  def show
    @use_case = UseCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @use_case }
    end
  end

  # GET /use_cases/new
  # GET /use_cases/new.json
  def new
    @use_case = UseCase.new
    @quote = Quote.find(params[:quote_id])


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @use_case }
    end
  end

  # GET /use_cases/1/edit
  def edit
    @use_case = UseCase.find(params[:id])
    @use_case.quote = Quote.find(params[:quote_id])
  end

  # POST /use_cases
  # POST /use_cases.json
  def create
      @quote = Quote.find(params[:quote_id])
    @use_case = @quote.use_cases.build(params[:use_case])

    respond_to do |format|
      if @use_case.save
        format.html { redirect_to @quote, notice: 'Use case was successfully created.' }
        format.json { render json: @use_case, status: :created, location: @use_case }
      else
        format.html { render action: "new" }
        format.json { render json: @use_case.errors, status: :unprocessable_entity }
      end
      realizarCostos
    end
  end

  # PUT /use_cases/1
  # PUT /use_cases/1.json
  def update
      @quote = Quote.find(params[:quote_id])
    @use_case = UseCase.find(params[:id])

    respond_to do |format|
      if @use_case.update_attributes(params[:use_case])
        format.html { redirect_to @quote, notice: 'Use case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @use_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /use_cases/1
  # DELETE /use_cases/1.json
  def destroy
      @quote = Quote.find(params[:quote_id])
    @use_case = UseCase.find(params[:id])
    @use_case.destroy

    respond_to do |format|
      format.html { redirect_to @quote }
      format.json { head :no_content }
    end
    realizarCostos
  end

  def realizarCostos
      dt = @quote.use_cases.sum(:design_time);
      pt = @quote.use_cases.sum(:programming_time);
#      dc = dt * @quote.cost_per_hour
#      pc = pt * @quote.cost_per_hour
#      tc = dc + pc
      @quote.total_hours = dt + pt
      @quote.total_cost = (dt+pt) * @quote.cost_per_hour
      @quote.save
  end

end
