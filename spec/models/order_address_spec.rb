require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入できるとき' do
    context '購入できるとき' do
      it 'すべてのフォームの入力がされている' do
        expect(@order_address).to be_valid
      end
      it "tokenがあれば保存ができること" do
        expect(@order_address).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it 'postal_code が空では登録できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_code が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '123ー4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'shipping_area_idが 1 では保存できないこと' do
        @order_address.shipping_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it 'municipality が空では保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'address が空では保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_number が空では保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_number が11桁以内の数値のみでなければ保存できないこと' do
        @order_address.phone_number = '０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
