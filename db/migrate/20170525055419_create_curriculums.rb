class CreateCurriculums < ActiveRecord::Migration[5.1]
  def change
    create_table :curriculums do |t|
      t.string :name
      t.integer :duration, limit: 1 #(1 byte, -128 to 127)

      t.timestamps
    end
  end
end
