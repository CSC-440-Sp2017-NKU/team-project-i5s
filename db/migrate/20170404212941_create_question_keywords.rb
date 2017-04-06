class CreateQuestionKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :question_keywords do |t|
      t.references :question, foreign_key: true
      t.references :keyword, foreign_key: true

      t.timestamps
    end
  end
end
