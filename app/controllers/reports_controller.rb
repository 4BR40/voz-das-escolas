class ReportsController < ApplicationController
  before_action :set_report, only: %i[show]

  def new
  end

  def create
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
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end
end
