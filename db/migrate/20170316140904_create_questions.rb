class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :text
      t.boolean :active, :default => true
      t.references :user, foreign_key: true
      t.references :forum, foreign_key: true
      
      t.timestamps
      
    end
  end
  

  
end
