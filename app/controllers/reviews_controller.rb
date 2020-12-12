class ReviewsController < ApplicationController
  before_action :set_report, only: %i[create]

  # def new
  # it is not necessary, since reviews will be injected on reports/show page
  # end

  def create
    @review = Review.new(review_params)
    @review.report = @report
    @review.user = current_user if current_user.school == @report.school
    if @review.save
      redirect_to report_path(@report)
    else
      render report_path(@report), notice: 'Tente novamente'
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

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
