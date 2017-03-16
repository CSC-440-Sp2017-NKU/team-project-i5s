class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums, id:false do |t|
      t.integer :forum_id
      t.string :forum_name
      t.string :forum_description
      t.primary_key :forum_id

      t.timestamps
    end
  end
end
