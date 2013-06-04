class Reply < ActiveRecord::Base
  attr_accessible :blog_id, :content, :user_id
end
