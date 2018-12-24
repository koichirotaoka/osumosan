class FavoritesController < ApplicationController
  
def create
    user=current_user
    house=House.find(params[:house_id])
    if Favorite.create(user_id: user.id,house_id: house.id)
      redirect_to house
    else
      redirect_to root_url
    end
end

  def destroy
    user=current_user
    house=House.find(params[:house_id])
    if favorite=Favorite.find_by(user_id: user.id,house_id: house.id)
      favorite.delete
      redirect_to users_path(current_user)
    else
      redirect_to root_url
    end
  end
end