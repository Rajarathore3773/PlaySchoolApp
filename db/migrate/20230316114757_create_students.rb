class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :s_fname
      t.string :s_lname
      t.string :s_address
      t.string :s_dob
      t.string :s_father
      t.string :s_mother
      t.string :s_age
      t.string :s_gender
      t.references :school, null: false, foreign_key: true
      t.references :sclass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
