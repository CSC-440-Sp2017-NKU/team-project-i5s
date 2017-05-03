class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.integer :question_id
      t.string :question_title
      t.string :question_text
      t.integer :question_user_id
      t.string :question_user_name
      t.string :keyword
      t.string :course_name
      t.integer :course_id
      t.integer :instructor_id
      t.string :instructor_name

      t.timestamps
    end
  end
end
