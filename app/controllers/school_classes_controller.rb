class SchoolClassesController < ApplicationController
    def index
    
    end
    
    def new
        @school_class = SchoolClass.new
    end

    def show
        @school_class = SchoolClass.find(params[:id])
    end

    def edit
        @school_class = SchoolClass.find(params[:id])
    end

    def create
        sc = SchoolClass.create(strong_params)
        redirect_to school_class_path(sc)
    end

    def update
        school_class = SchoolClass.find(params[:id])
        school_class.update(strong_params)
        redirect_to school_class_path(school_class)
    end 

    def strong_params
        params.require(:school_class).permit(:title, :room_number)
    end
end