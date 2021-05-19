class UsersController < ApplicationController
  def update
    raise
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def set_user

  end

  private

  def user_params
    params.require(user).permit(:photo)
  end
end
