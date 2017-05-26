class EnrollmentsController < ApplicationController
  def index
    @curriculum = Curriculum.find(params[:curriculum_id])
    @nonStudents = Student.all
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
      flash[:notice] = "Enrollment registered successfully."
      redirect_to curriculum_path(params[:curriculum_id])
    else
      # fail
    end
  end

  private
    def enrollment_params
      params.permit(:curriculum_id, :student_id, :grade)
    end
end
