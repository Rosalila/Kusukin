class HomeworkPaymentsController < ApplicationController
  before_action :set_homework_payment, only: [:show, :edit, :update, :destroy]

  # GET /homework_payments
  # GET /homework_payments.json
  def index
    @homework_payments = HomeworkPayment.all
  end

  # GET /homework_payments/1
  # GET /homework_payments/1.json
  def show
  end

  # GET /homework_payments/new
  def new
    @homework_payment = HomeworkPayment.new
  end

  # GET /homework_payments/1/edit
  def edit
  end

  # POST /homework_payments
  # POST /homework_payments.json
  def create
    @homework_payment = HomeworkPayment.new(homework_payment_params)

    respond_to do |format|
      if @homework_payment.save
        format.html { redirect_to @homework_payment, notice: 'Homework payment was successfully created.' }
        format.json { render :show, status: :created, location: @homework_payment }
      else
        format.html { render :new }
        format.json { render json: @homework_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homework_payments/1
  # PATCH/PUT /homework_payments/1.json
  def update
    respond_to do |format|
      if @homework_payment.update(homework_payment_params)
        format.html { redirect_to @homework_payment, notice: 'Homework payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework_payment }
      else
        format.html { render :edit }
        format.json { render json: @homework_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homework_payments/1
  # DELETE /homework_payments/1.json
  def destroy
    @homework_payment.destroy
    respond_to do |format|
      format.html { redirect_to homework_payments_url, notice: 'Homework payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework_payment
      @homework_payment = HomeworkPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homework_payment_params
      params.require(:homework_payment).permit(:user_id, :homework_id)
    end
end
