class ReviewsController < ApplicationController
  before_action :set_report, only: %i[new create]

  # def new
  # it is not necessary, since reviews will be injected on reports/show page
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.roubada = @roubada
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: 'Ok, você entrou nessa roubada por sua conta e risco!'
    else
      redirect_to roubada_path(@roubada), notice: 'Humm, algo deu errado. Parece que você já entrou nessa roubada...'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  def set_report
    @report = Report.find(params[:report_id])
  end
end
