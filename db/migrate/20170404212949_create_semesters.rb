class CreateSemesters < ActiveRecord::Migration[5.0]
  def change
    create_table :semesters do |t|
      t.integer :academic_year
      t.string :session

      t.timestamps
    end
  end
end
