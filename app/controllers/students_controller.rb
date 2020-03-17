class StudentsController < ApplicationController
    def index
    
    end
    
    def new
        @student = Student.new
    end

    def show
        @student = Student.find(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
    end

    def create
        student = Student.create(strong_params)
        redirect_to student_path(student)
    end

    def update
        student = Student.find(params[:id])
        student.update(strong_params)
        redirect_to student_path(student)
    end 

    def strong_params
        params.require(:student).permit(:first_name, :last_name)
    end
    
end