class ReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  before_action :set_report, only: %i[show]


  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.school_id = current_user.school_id
    # authorize @report
    if @report.save
      # redirect_to reports_path
      redirect_to @report, notice: 'Seu relato foi criado'
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @reports = Report.all
  end

  def show
    @review = Review.new
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:description, :photos, :category_id)
  end
end
