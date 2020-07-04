class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.favo(current_user)
    flash[:success] ='お気に入りに登録しました'
    redirect_to root_url
  end

  def destroy
    @micropost = Favorite.find(params[:id]).micropost
    @micropost.unfavo(current_user)
    flash[:success] ='お気に入りに登録を解除しました'
    redirect_to root_url
  end
end
