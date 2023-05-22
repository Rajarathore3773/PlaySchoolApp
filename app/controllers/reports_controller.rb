class ReportsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def index
    reports = Report.all
    render json: reports , status:200
  end

  def show
    #debugger
    #report = Report.find_by(id: params[:id])
    student =Student.find_by(id: params[:id])

    #student =Student.find(params[:id])
     if student.present?
      #render json:report ,status:200
       #Student Ki puri Repot ek sath dene ke liye 
        @report = student.reports.all 
         @student_data = student        
        @student_school = student.school
        @student_sclass =student.sclass
       render json:{report: @report, student_data: @student_data, student_school: @student_school ,student_sclass:  @student_sclass} , status:200
   

      #  @student_data = Student.where(s_fname: "Rohit",)
      #  @student_class = Sclass.where(c_name: "K.G 2")
      #  @student_school = School.where(sch_name: "R.S Academy")
      #  @pickup = Report.where(picktime: "Sun, 19 Mar 2023 ")
      #   render json: {student_sclass: @student_class, student_data: @student_data, student_school: @student_school, pickup: @pickup }, status: 200

            # students = Student.all
            # @s_lname =students.where('s_lname LIKE ?', "pal%")
            # @s_age = students.where('s_age LIKE ?', "2%")
            # @s_father =students.where(s_father: "Binod")
            # @s_address = students.where('s_address LIKE ?', "22 Nandbag%")
            # @school_id =students.where(school_id: 3)

            # @s_id =Student.where("id = ?", params[:id])


            #  render json:{s_lname: @s_lname, s_age:@s_age, s_father: @s_father, school_id: @school_id,  s_address:  @s_address , s_id: @s_id } , status: 200
      
        else
            render json:{errors:"This id report not present"}
        end
  end

  def school
      school = School.find_by(id: params[:id])
      if school.present?
        data = school.reports
        render json: data, status:200
     
      else
        render json:{errors:"This id report not present"}
     end
end
    def class1
        sclass = Sclass.find_by(id: params[:id])
        if sclass.present?
          data = sclass.reports
          render json: data, status:200
        else
          render json:{errors:"This id report not present"}
      end

    end

    def student
      student = Student.find_by(id: params[:id])
      if student.present?
        data = student.reports
        render json: data, status:200
      else
        render json:{errors:"This id report not present"}
    end

  end

  def filter
   # debugger
    stu = Student.all
   report= stu.find_by(s_lname: params[:s_lname],s_fname: params[:s_fname],s_age: params[:s_age])
     if report.present?
      data = report.s_lname
      data1= report.s_fname
      @s_age=report.s_age
     render json:{ s_lname: data, s_fname: data1, s_age: @s_age}, status:200
     else
      render json:{errors:"This id report not present"}
     end

  end



  def create
    #debugger
    report = Report.new(report_params)
    if report.save
        render json:report , status:200
    else
         render json: report.errors.full_messages
    end
  end

  def update
    report = Report.find_by(id: params[:id])
    if report.update(report_params)
        render json:report , status:200
    else
        render json:{error:"This id not available for update"}
    end
  end

  def destroy
   # byebug
    report = Report.find_by(id: params[:id])
    if report.present?
        report.destroy
        render json:"Report Deleted"
    else
        render json:{errors:"This id not avilable for Delete" }
    end
  end

  private 
   def report_params
    params.require(:report).permit(:picktime, :droptime, :school_id, :sclass_id,:student_id)
   end

end
