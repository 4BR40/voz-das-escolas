class ReportsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new]
  before_action :set_report, only: %i[show edit update upvote downvote]
  respond_to :js, :html, :json

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

  def edit
  end

  def update
    @report.update(report_params)
    redirect_to report_path(@report)
  end



  def destroy
  end

  def index
    @reports = Report.all
  end

  def show
    @review = Review.new
  end

  def upvote
    # @report = Report.find(params[:id])
    @report.upvote_by current_user
    redirect_to school_reports_path(@report.school)
  end

  def downvote
    # @report = Report.find(params[:id])
    @report.downvote_by current_user
    redirect_to school_reports_path(@report.school)
  end


  private

  def set_report
    @report = Report.find(params[:id])

  end

  def report_params
    params.require(:report).permit(:description, :category_id, photos: [])

  end
end
