class Sclass < ApplicationRecord
    has_many :students
    has_many :reports
    belongs_to :school
    
    
   
    validates :c_name,  presence:true
    validates  :c_teacher, presence:true
end
