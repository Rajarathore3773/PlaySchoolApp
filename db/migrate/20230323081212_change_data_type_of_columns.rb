class ChangeDataTypeOfColumns < ActiveRecord::Migration[7.0]
  def change
      reversible do |dir|
         dir.up do 
          #change_column :table_name, :column_name, :new_data_type
          change_column :schools, :sch_address, :text
          change_column :schools, :sch_email, :text
          change_column :schools, :sch_code, :integer
         
          change_column :sclasses, :c_name, :text

          change_column :students, :s_address, :text
          change_column :students, :s_dob, :date
          change_column :students, :s_age, :integer

         end
         
         dir.down do
          change_column :schools, :sch_address, :string
          change_column :schools, :sch_email, :string
          change_column :schools, :sch_code, :string
         
          change_column :sclasses, :c_name, :string

          change_column :students, :s_address, :string
          change_column :students, :s_dob, :string
          change_column :students, :s_age, :string
        end
        
      end

  end
end
