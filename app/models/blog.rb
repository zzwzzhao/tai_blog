# -*- encoding : utf-8 -*-
class Blog < ActiveRecord::Base
  attr_accessible :content, :tag, :title
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true
end
