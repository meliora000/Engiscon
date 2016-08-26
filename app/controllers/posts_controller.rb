class PostsController < ApplicationController
  include ApplicationHelper
  before_action :set_category, except: [:index, :dance]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def dance

  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @post}
    end
  end

  def new
    @post = @category.posts.new
  end

  def edit
  end

  def create
    @post = @category.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to category_path(@category)}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [@post.category, @post], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to category_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_post
    @post = @category.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :avatar)
  end
end
