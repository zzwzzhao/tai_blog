# -*- encoding : utf-8 -*-
class Blog < ActiveRecord::Base
  attr_accessible :content, :tag, :title, :user_id
end
