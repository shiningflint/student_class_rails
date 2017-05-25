class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
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

  def update
    if @student.update(student_params)
      flash[:notice] = "The student information has been updated!"
      redirect_to student_path(@student)
    else
      flash.now[:alert] = "Student has not been updated"
      render "edit"
    end
  end

  def destroy
    @student.destroy
    flash[:notice] = "Student record has been deleted successfully."
    redirect_to students_path
  end

  private
    def student_params
      params.require(:student).permit(:name, :date_of_birth, :phone)
    end

    def set_student
      @student = Student.find(params[:id])
    end
end
