class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation
  before_action :sold_out

  def index
    redirect_to new_card_path and return unless current_user.card.present?
    @order_address = OrderAddress.new
  end

  def create
    redirect_to new_card_path and return unless current_user.card.present?
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      # if 購入画面から来たユーザーなら
      #   redirect_to item_orders_path
      # else
        redirect_to root_path
      # end
    else
      render :index
    end
  end
  
  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      customer: customer_token,    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user.id
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end
  
end
