class StudentsController < ApplicationController

  def index
    if(params[:name])
      student_by_first_or_last = Student.where(first_name: params[:name].capitalize).or(Student.where(last_name: params[:name].capitalize))
      render json: student_by_first_or_last 
    else
      students = Student.all
      render json: students
    end
  end

  def show
    student = Student.find_by(id: params[:id])
    render json: student
  end
end
