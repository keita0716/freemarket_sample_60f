class Api::ItemsController < ApplicationController

  def image_destroy
    image = Image.find(params[:img_id])
    if image.item.seller_id == current_user.id
      image.destroy
    end
  end

end