class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.references :post

      t.timestamps
    end
    add_index :comments, [:created_at]
  end

  def self.down
    drop_table :comments
  end
end
