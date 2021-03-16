class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @active_response = @student.active ? ("This student is currently active.") : ("This student is currently inactive.")
  end

  def active
    student = Student.find_by_id(params[:id])
    student.toggle!(:active)
    # byebug
    redirect_to student_path(student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end