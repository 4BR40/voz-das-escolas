class SchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new]
  before_action :set_school, only: %i[show edit update destroy]

  def index
    @schools = School.all
    @categories = Category.all
    @markers = @schools.map do |school|
      {
        lat: school.lat,
        lng: school.lng,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { school: school })
      }
    end

    if params["query"]
      # @filter = params["search"]["flavors"].concat(params["search"]["strengths"]).flatten.reject(&:blank?)
      @reports = Report.all.search_general(params[:query])
    else
      @reports = Report.all
      # puts @reports
    end
    respond_to do |format|
      format.html
      format.js
      format.json { render json: { reports: @reports } }
    end

    # if params[:query].present?
    #   @schools = policy_scope(School).search_general(params[:query])
    # else
    #   # @schools = School.all
    #   @schools = policy_scope(School).order(created_at: :desc)
    # end
  end

  def new
    @school = School.new
    authorize @school
  end

  def create
    @school = School.new(school_params)
    @school.user_id = current_user.id
    authorize @school
    if @school.save
      # redirect_to schools_path
      redirect_to @school, notice: 'School nova na área!'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @school.update(school_params)
    redirect_to school_path(@school)
  end

  def destroy
    @school.destroy
    redirect_to schools_path, notice: 'Ok, sua escola foi excluída com sucesso.'
  end

  private

  def set_school
    @school = School.find(params[:id])
    authorize @school
  end

  def school_params
    params.require(:school).permit(:name, :photo)
  end
end
