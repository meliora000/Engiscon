class UsersController < ApplicationController
  before_action :set_user, only: :update

  def update
    @user.update(user_params)
    @ename = @user.ename



    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:ename)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def qualified_user_only
    current_user == @user
  end
end
