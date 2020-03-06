class MypageController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def edit
  end

end