class CardsController < ApplicationController
  def new
    # sessionに直前のURLを入れる
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer = Payjp::Customer.create(
    description: 'test', # テストカードであることを説明
    card: params[:card_token] # 登録しようとしているカード情報
    )
    card = Card.new( 
      card_token: params[:card_token], 
      customer_token: customer.id, 
      user_id: current_user.id 
    )
    if card.save
      redirect_to root_path
      # newのところで入れておいたurlへリダイレクト
    else
      redirect_to "new" # カード登録画面
    end
  end
end
