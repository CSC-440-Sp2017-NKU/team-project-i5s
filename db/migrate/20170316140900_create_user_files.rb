class CreateUserFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_files do |t|
      t.string :resource_text
      t.string :resource_url
      t.binary :attached_file
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
