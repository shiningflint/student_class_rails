class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = "The student is successfully registered!"
      redirect_to student_path(@student)
    else
      flash.now[:alert] = "The student is not registered."
      render "new"
    end
  end

  private
    def student_params
      params.require(:student).permit(:name, :date_of_birth, :phone)
    end
end
