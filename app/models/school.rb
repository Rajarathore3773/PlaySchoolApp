class School < ApplicationRecord
    has_many :students

    has_many :sclasses

    has_many :reports
    
    validates :sch_name , :sch_address, presence:true
    validates :sch_email , presence:true , uniqueness:true
    validates :sch_code , presence:true , uniqueness:true
end
