class BasketItemsController < ApplicationController
  authorize_resource

  respond_to :json, :html

  before_filter do
    session[:rooms] = [] unless session[:rooms]
  end

  def index
    @basket_items = BasketItem.mine.all

    respond_with @basket_items do |r|
      r.html { render }
      r.json { render json: @basket_items.to_json(include: { room: { only: [:name], include: { hotel: { only: [:name] } } } }) }
    end
  end

  def create
    if params[:id]
      BasketItem.create room_id: params[:id]
    end

    render json: { ok: true }
  end

  def destroy
    BasketItem.delete_all user_id: current_user.id, room_id: params[:id]
    redirect_to baskets_path
  end

  def clear
    BasketItem.delete_all user_id: current_user.id
    redirect_to baskets_path
  end

  def show
  end
end
