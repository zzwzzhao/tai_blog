# -*- encoding : utf-8 -*-
class BlogsController < ApplicationController
  before_filter :admin_user, only: [:new, :create, :edit, :update, :destroy]
  def index
    @blogs = Blog.paginate(page: params[:page])
  end

  def new
    @blog = current_user.blogs.build
  end

  def create
    @blog = current_user.blogs.build(params[:blog])
    if @blog.save
      flash[:success] = "博客发布成功"
      redirect_to @blog
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      flash[:success] = "博客更新已成功"
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    Blog.find(params[:id]).destroy
    flash[:success] = "博客已删除"
    redirect_to blogs_path
  end


  def show
    @blog = Blog.find(params[:id])
  end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
