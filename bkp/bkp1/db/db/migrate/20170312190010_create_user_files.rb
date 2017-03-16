class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.string :resource_text
      t.integer :user_id
      t.string :resource_url
      t.binary :attached_file
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
