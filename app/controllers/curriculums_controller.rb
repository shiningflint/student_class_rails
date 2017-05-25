class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: [:show]

  def index
  end

  def new
    @curriculum = Curriculum.new
  end

  def show
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

  private
    def curriculum_params
      params.require(:curriculum).permit(:name, :duration)
    end

    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end
end
