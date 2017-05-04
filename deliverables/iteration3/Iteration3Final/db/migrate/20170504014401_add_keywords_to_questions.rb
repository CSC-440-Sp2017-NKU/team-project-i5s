class AddKeywordsToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :keywords, :string
  end
end
