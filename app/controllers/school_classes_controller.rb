class SchoolClassesController < ApplicationController
    def new
        @school_class = SchoolClass.new
    end
    
    def create
        school_class = SchoolClass.new(school_class_params(:title, :room_number))
        if school_class.save
            redirect_to school_class_path(school_class)
        else
            raise school_class
        end
    end
    
    def show
        find_and_set_school_class_by_id
    end
    
    def edit
        find_and_set_school_class_by_id
    end
    
    def update
        find_and_set_school_class_by_id
        @school_class.update(school_class_params(:title, :room_number))
        if @school_class.save
            redirect_to school_class_path(@school_class)
        else
            raise @school_class
        end
    end

    private

    def school_class_params(*args)
        params.require(:school_class).permit(*args)
    end

    def find_and_set_school_class_by_id
        @school_class = SchoolClass.find(params[:id])
    end
end
