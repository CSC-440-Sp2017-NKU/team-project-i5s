class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions, id:false do |t|
      t.integer :question_id
      t.string :question_title
      t.string :question_description
      t.boolean :active
      t.primary_key :question_id
      t.references :user, index: true, foreign_key: true
      t.references :forum, index: true, foreign_key: true

      t.timestamps
    end
  end
end
