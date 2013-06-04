# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
  def home
    @blogs = Blog.paginate(page: params[:page])
  end

  def help
  end

  def about
  end

  def contact
  end
end
