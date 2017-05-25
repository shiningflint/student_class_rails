class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: [:show, :edit, :update, :destroy]

  def index
    @curriculums = Curriculum.all
  end

  def new
    @curriculum = Curriculum.new
  end

  def show
  end

  def edit
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
    if @curriculum.save
      flash[:notice] = "Curriculum has been created successfully."
      redirect_to curriculum_path(@curriculum)
    else
      flash.now[:alert] = "Curriculum was not created."
      render "new"
    end
  end

  def update
    if @curriculum.update(curriculum_params)
      flash[:notice] = "Curriculum has been updated successfully!"
      redirect_to curriculum_path(@curriculum)
    else
      flash.now[:alert] = "Curriculum has not been updated."
      render "edit"
    end
  end

  def destroy
    @curriculum.destroy
    flash[:notice] = "Curriculum record has been deleted successfully."
    redirect_to curriculums_path
  end

  private
    def curriculum_params
      params.require(:curriculum).permit(:name, :duration)
    end

    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end
end
