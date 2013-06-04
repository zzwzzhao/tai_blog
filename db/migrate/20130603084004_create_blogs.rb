# -*- encoding : utf-8 -*-
class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :tag

      t.timestamps
    end
    add_index :blogs, :tag
  end
end
