# -*- encoding : utf-8 -*-
class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :blog_id
      t.text :content

      t.timestamps
    end
    add_index :replies, :user_id
    add_index :replies, :blog_id
  end
end
