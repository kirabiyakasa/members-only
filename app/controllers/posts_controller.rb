class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path,
        notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors,
        status: :unprocessable_entity }
      end
    end
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, 
      notice: 'Post was successfully deleted.' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
