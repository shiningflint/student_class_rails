class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :date_of_birth
      t.string :phone

      t.timestamps
    end
  end
end
