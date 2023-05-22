class CreateSclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :sclasses do |t|
      t.string :c_name
      t.string :c_teacher
      t.timestamps
    end
  end
end
