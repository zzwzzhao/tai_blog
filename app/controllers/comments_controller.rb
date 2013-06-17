# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: [:edit, :update, :destroy]
  before_filter :find_blog_and_comment, only: [:edit, :update, :destroy]

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:success] = "评论已成功"
      redirect_to @blog
    else
      redirect_to @blog
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(params[:comment])
      flash[:success] = "评论已更新"
      redirect_to @blog
    else
      render "edit"
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "评论已删除"
    redirect_to @blog
  end

  private
    def correct_user
      @comment = current_user.comments.find_by_id(params[:id])
      if @comment.nil? and !current_user.admin?
        redirect_to root_url
      end
    end

    def find_blog_and_comment
      @blog = Blog.find(params[:blog_id])
      @comment = Comment.find(params[:id])
    end
end
