class StudentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        students =Student.all
        render json:students , status:200
    end
    
    def show 
        
        student = Student.find_by(id: params[:id])
        if student.present?
            render json:student , status:200
        else
            render json:{error:"This id Student Not Found" }
        end
    end

    def create 
         #debugger
        student = Student.new(student_params)
        if student.save
            render json: student , status:200
            #  render json: {
            #      message: "Student Successfully created",
            #    #  student: StudentSerializer.new(st).serializable_hash
            #  },status: 200
        else
            render json: student.errors.full_messages
        end
    end

    def update 
    
        student = Student.find_by(id: params[:id])
        if student.present?
            student.update(student_params)
            render json:student , status:200
        else
            render json:{error:"This id not available for update"}
        end
    end


    def destroy
      
          student = Student.find_by(id: params[:id])
          if student.present?
            student.destroy
            render json:"Deleted Student"
          else
            render json:{error: "This id not avilable for Delete"}
          end
    end
   
    def first_name
        #students = Student.all
       # student = student.where("s_fname LIKE ?", "%Rama")
        f_name = Student.where(s_fname: params[:s_fname])
        if   f_name.present?
             render json:f_name, status:200
        else
            render json:{error: "This first names of student not present in database"}
        end
    end

    def last_name
        #debugger
        #student = Student.all
        # student = student.where("s_fname LIKE ?", "%Rama")
         l_name = Student.where(s_lname: params[:s_lname])
         if  l_name.present?
              render json:l_name, status:200
         else
             render json:{error: "This last names of student not present in database"}
         end
    end

    def age 
        age = Student.where(s_age: params[:s_age])
        if age.present?
            render json:age, status:200
        else
            render json:{error: "This age of  student not present in database"}
        end
    end

    def address
        address  = Student.where(s_address: params[:s_address])
          # = student.where("s_fname LIKE ?", "%?")
        if address.present?
            render json:address, status:200
        else
            render json:{error: "This address of student not present in database"}
        end
    end

    def father_name 
        father = Student.where(s_father: params[:s_father])
        if father.present?
            render json:father, status:200
        else
            render json:{error: "This father name of student not present in database"}
        end
    end

    def mother_name
        mother = Student.where(s_mother: params[:s_mother])
        if mother.present?
            render json:mother, status:200
        else
            render json:{error: "This mother name of student not present in database"}
        end
    end

    private
    def student_params
        params.require(:student).permit(:s_fname , :s_lname, :s_address, :s_dob, :s_father, :s_mother, :s_age, :s_gender, :school_id, :sclass_id, :image)
    end

end
