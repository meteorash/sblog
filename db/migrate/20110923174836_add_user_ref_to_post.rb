class AddUserRefToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.references :user
    end
  end

  def self.down
    drop_table :posts
  end
end
