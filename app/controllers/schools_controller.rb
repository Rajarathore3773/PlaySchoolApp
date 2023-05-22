class SchoolsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        schools = School.all
    
        render json: schools , status:200
    end

    def show
        
        school = School.find_by(id: params[:id])
        if school.present?
        render json: school , status:200
        else 
            render json:{error:"This school id not avilable"}
        end
    end
    
    def create
     school = School.new(school_params)
     if school.save
        render json:school , status:200
     else
        render json:{error:"Again create school data and use all fields"}
     end
   end

    def update
        school = School.find_by(id:params[:id])
        if school.present?
         school.update(school_params)
         render json:school , status:200
        else
            render json:{error:"This id Not Available for update"}
        end
    end

    def destroy
        school = School.find_by(id:params[:id])
         if school.present?
            school.destroy
         render json:{message:"successfull deleted"}
        else
            render json:{error:"This id Not Available for Delete"}
        end
    end

    def school_students
        school = School.find_by(id:params[:id])
        student = school.students
        if student.present?
            render json:student , status:200
        else
            render json:{error:"This school student not available for"}
        end
    end

    def school_classes
        school = School.find_by(id:params[:id]) 
        sclass= school.sclasses
        if sclass.present?
            render json:sclass , status:200
        else
            render json:{error:"This school class not available for"}
        end
    end
    private 
    def school_params
       params.require(:school).permit(:sch_name ,:sch_address, :sch_email,:sch_code) 
    end

end
