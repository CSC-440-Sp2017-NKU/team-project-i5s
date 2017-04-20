class CreateStudentSections < ActiveRecord::Migration[5.0]
  def change
    create_table :student_sections do |t|
      t.references :user, foreign_key: true
      t.references :section, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
