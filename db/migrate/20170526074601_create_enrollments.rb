class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.references :curriculum, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :grade, limit: 1 #(1 byte, -128 to 127)

      t.timestamps
    end
  end
end
