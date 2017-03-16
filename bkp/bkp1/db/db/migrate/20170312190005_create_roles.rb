class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles, id:false do |t|
      t.integer :role_id
      t.string :role
      t.primary_key :role_id

      t.timestamps null: false
    end
  end
end
