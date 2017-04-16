class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers, id:false do |t|
      t.integer :answer_id
      t.string :answer
      t.boolean :active
      t.integer :user_id
      t.primary_key :answer_id
      t.integer :question_id
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps
    end
  end
end
