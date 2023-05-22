class SclassesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        sclass = Sclass.all
        render json:sclass , status:200
    end

    def show
        sclass = Sclass.find_by(id:params[:id])
        if sclass.present?
            render json:sclass , status:200
        else
            render json:{error:"This id class not available"}
        end
    end

    def create
        sclass = Sclass.new(class_params)
        if sclass.save
            render json:sclass , status:200
        else
            render json:sclass.errors.full_messages

            #render json: sclass.errors, status: :unprocessable_entity

        end
    end

     def update
        sclass = Sclass.find(params[:id])
        if sclass.present?
            sclass.update(class_params)
            render json:sclass , status:200
        else
             render json:{error:"This id class not available for update"}
        end
     end

    def destroy
        sclass = Sclass.find_by(id:params[:id])
        if sclass.present?
            sclass.destroy
            render json:{message:"Successfully Deleted this id Class"}
        else
            render json:{message:"this id Class is not available for Delete "}
 
        end
    end


    def  sclass_school
        sclass = Sclass.find(params[:id])
        school = sclass.school
        if school.present?
            render json:school , status:200
        else
            render json:{message:"this class id school not match"}
        end
    end
    def  sclass_students
        sclass = Sclass.find(params[:id])
        student = sclass.students
        if student.present?
            render json: student, status:200
        else
            render json:{message:"this class id school not match"}
        end
    end

     private
     def class_params
        params.require(:sclass).permit(:c_name, :c_teacher, :school_id)
     end

end
