class StudentsController < ApplicationController

    def new
        @student = Student.new
    end
    
    def create
        student = Student.new(student_params(:first_name, :last_name))
        if student.save
            redirect_to student_path(student)
        else
            raise student
        end
    end
    
    def show
        find_and_set_student_by_id
    end
    
    def edit
        find_and_set_student_by_id
    end
    
    def update
        find_and_set_student_by_id
        @student.update(student_params(:first_name, :last_name))
        if @student.save
            redirect_to student_path(@student)
        else
            raise @student
        end
    end

    private

    def student_params(*args)
        params.require(:student).permit(*args)
    end

    def find_and_set_student_by_id
        @student = Student.find(params[:id])
    end
end
