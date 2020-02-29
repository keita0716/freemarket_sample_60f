class Api::ItemsController < ApplicationController

  def image_destroy
    begin
      image = Image.find(params[:img_id])
      if image.item.seller_id == current_user.id
        image.destroy
      end
    rescue
      puts "削除に失敗しました"
    end


  end

end