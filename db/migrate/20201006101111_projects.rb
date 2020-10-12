class Projects < ActiveRecord::Migration[6.0]
  def self.up
    # drop_table :projects
    create_table :projects do |t|
      t.column :user_id, :integer
      t.column :title, :string, :limit => 50, :null =>  false
      t.column :description, :text
      t.column :completion, :integer, :default => 0
      t.timestamps
    end
  end

  def self.down 
    drop_table :projects
  end
end
