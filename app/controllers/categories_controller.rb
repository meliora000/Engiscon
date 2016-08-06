class CategoriesController < ApplicationController
  include ApplicationHelper
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categories}
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.option = @category.option + ", sub: " +@category.sub.join(",")
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path}
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @posts = @category.posts.order("created_at ASC")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@category,@posts]}
    end
  end

  def edit
    @categories = Category.all
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title,:option, sub:[])
  end
end
