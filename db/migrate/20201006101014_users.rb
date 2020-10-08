class Users < ActiveRecord::Migration[6.0]
  def self.up
    # drop_table :users
    create_table :users do |t|
      t.column :fullname, :string, :limit => 50, :null =>  false
      t.column :email, :string, :null => false
      t.column :password, :string, :null => false
      t.column :user_role, :string, :limit => 10, :default => 'user'
    end    

    User.create({
      :fullname => "Administrator",
      :email => "admin@ogcamp.com",
      :password => "admin",
      :user_role => "admin"
    })
  end

  def self.down 
    drop_table :users
  end
end
