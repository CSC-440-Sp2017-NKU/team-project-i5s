class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :direction
      t.references :answers, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
     # t.index ["answers_id", "user_id"], name: "uq_idx_on_answers_users", unique:true
    end
    
    #add_index :votes, [:answers, :user], :unique=> true  
    #add_index :votes, [:answers_id, :user_id], name: "index_comments_on_post_id", unique: true
  end
end
