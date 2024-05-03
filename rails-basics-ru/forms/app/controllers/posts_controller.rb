# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'New Post was successfully created'
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Post cannot be created'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated'
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Post cannot be updated'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post was successfully deleted'
      redirect_to posts_path
    else
      flash[:failure] = 'Post cannot be deleted'
      redirect_to post_path(@post)
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :title, :body, :summary, :published)
  end
end
