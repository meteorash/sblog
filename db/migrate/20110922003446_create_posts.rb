class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :likes

      t.timestamps
    end
    add_index :posts, [:created_at]
  end

  def self.down
    drop_table :posts
  end
end
