class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id:false do |t|
      t.integer :user_id
      t.string :user_name
      t.string :password
      t.primary_key :user_id
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
