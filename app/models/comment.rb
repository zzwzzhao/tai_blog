# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  belongs_to :blog, counter_cache: true

  validates :user_id, presence: true
  validates :blog_id, presence: true
  validates :content, presence: true
end
