class CreateForums < ActiveRecord::Migration[5.0]
  def change
    create_table :forums do |t|
      t.string :forum_name
      t.string :forum_description
      t.string :resource_url

      t.timestamps
    end
  end
end
