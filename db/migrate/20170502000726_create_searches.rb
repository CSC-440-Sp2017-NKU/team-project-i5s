class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :subject
      t.string :title
      t.string :user_name
      t.integer :user_id
      t.string :keyword

      t.timestamps
    end
  end
end
