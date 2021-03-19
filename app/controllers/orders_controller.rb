class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation
  before_action :sold_out

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
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
