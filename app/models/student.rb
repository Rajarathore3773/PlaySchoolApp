class Student < ApplicationRecord
  belongs_to :school
  belongs_to :sclass
   
  has_many :reports , dependent: :destroy

  has_one_attached :image 
  
  # has_many_attached :images
  validate :age_validation
  validate :valid_s_fname

  

  def age_validation 
    if s_age.to_i >= 5
      errors.add(:student_age, " is too high age")
    end
  end

 

  validates :s_fname, presence: true, length: { maximum: 10 }
  validates :s_lname, presence: true, length: { maximum: 10 }
  validates :s_address, presence: true, length: { maximum: 50 }
  validates :s_father,:s_mother, presence:true, length: { maximum: 10 }
  validates :s_dob,:s_gender,presence:true

  private

  def valid_s_fname
    if s_fname.present? && !s_fname.match(/\A[a-zA-Z]+\z/)
      errors.add(:s_fname, "can only contain letters")
    end
    if s_lname.present? && !s_lname.match(/\A[a-zA-Z]+\z/)
      errors.add(:s_lname, "can only contain letters")
    end

    if s_father.present? && !s_father.match(/\A[a-zA-Z]+\z/)
      errors.add(:s_father, "can only contain letters")
    end
    if s_mother.present? && !s_mother.match(/\A[a-zA-Z]+\z/)
      errors.add(:s_mother, "can only contain letters")
    end

    if s_address.present? && !s_address.match(/\A[a-zA-Z0-9 ]+\z/)
      errors.add(:s_address, "can only contain letters & number")
    end
    
  end


end
