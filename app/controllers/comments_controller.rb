# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:success] = "评论已成功"
      redirect_to @blog
    else
      render @blog
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "评论已删除"
    redirect_to @blog
  end
end
