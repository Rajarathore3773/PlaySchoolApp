class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :sch_name
      t.string :sch_address
      t.string :sch_email
      t.string :sch_code

      t.timestamps
    end
  end
end
