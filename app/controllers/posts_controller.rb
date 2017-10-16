class PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def show
    @post=Post.find_by(id: params[:id])
  end

  def new
    require_user
    @post=Post.new
  end

  def create
    @post=current_user.posts.new(params[:post])
    if @post.save
      redirect_to '/'
    else
      @errors = "Try again."
      render '/posts/new'
    end
  end

  def delete
    @post=Post.find_by(id: params[:id])
    @post.destroy!
    redirect_to '/'
  end

  def edit
    @post=Post.find_by(id: params[:id])
  end

  def update
    @post=Post.find_by(id: params[:id])
    if @post.update(title: params[:post][:title], body: params[:post][:body], user_id: current_user.id)
      redirect_to '/posts/#{@post.id}'
    else
      @errors = "Try again."
      render '/posts/edit'
    end
  end
end
