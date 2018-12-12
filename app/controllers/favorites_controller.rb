class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:house_id])
    redirect_to houses_path, notice: "#{favorite.house.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to houses_path, notice: "#{favorite.house.user.name}さんのブログをお気に入り解除しました"
  end
end
