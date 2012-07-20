class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.string :user_name
      t.string :user_type
      t.text :about_me
      t.text :references
      t.references :user
      
      t.timestamps
    end
  end

  def down
    drop_table :profiles
  end
end
