# -*- encoding : utf-8 -*-
class RepliesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def create
    @blog = Blog.find(params[:blog_id])
    @reply = @blog.replies.build(params[:reply])
    @reply.user = current_user
    if @reply.save
      flash[:success] = "回复已成功"
      redirect_to @blog
    else
      render @blog
    end
  end

  def edit
    @blog = Blog.find(params[:topic_id])
    @reply = Reply.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @reply = @blog.replies.find(params[:id])
    @reply.destroy
    flash[:success] = "回复已删除"
    redirect_to @blog
  end
end
