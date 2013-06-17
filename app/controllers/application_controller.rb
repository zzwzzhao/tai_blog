# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  before_filter :get_tags
  protect_from_forgery
  include SessionsHelper
  include UsersHelper

  def get_tags
    @tags = Blog.select("tag, count(*) as tag_number").group(:tag)
  end
end
