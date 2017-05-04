class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name,   :null => false, :default => ''
      t.references :role, foreign_key: true, :default => 2
      #Authlogic fields
      t.string    :login,             :null => false, :default => ''
      t.string    :crypted_password,    :null => false, :default => '12345678'
      t.string    :password_salt,       :null => false, :default => ''
      t.string    :email,               :null => false, :default => ''
      t.string    :persistence_token,   :null => false, :default => ''
      t.string    :single_access_token, :null => false, :default => ''
      t.string    :perishable_token,    :null => false, :default => ''                

      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip   
      
      t.timestamps
    end
  end
end
