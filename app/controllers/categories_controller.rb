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

  def show
    @posts = @category.posts.order("created_at DESC")
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
end
