class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.datetime :picktime
      t.datetime :droptime
      t.references :student, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true
      t.references :sclass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
