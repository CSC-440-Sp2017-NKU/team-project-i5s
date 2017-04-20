class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.references :semester, foreign_key: true
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
