class Report < ApplicationRecord
  belongs_to :student
  belongs_to :school
  belongs_to :sclass
  validates :picktime , :droptime , presence:true
end
