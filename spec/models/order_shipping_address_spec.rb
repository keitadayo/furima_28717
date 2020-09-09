require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '商品購入' do
    before do
      @order = FactoryBot.build(:order_shipping_address)
    end

    it 'すべての項目があれば購入できること' do
      expect(@order).to be_valid
    end

    it 'クレジットカード情報が空では購入できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空では購入できないこと' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンが必要であること' do
      @order.postal_code = 1_234_567
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '都道府県が無選択では購入できないこと' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture Select')
    end

    it '市区町村が空では購入できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では登録できないこと' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では購入できないこと' do
      @order.phone = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号にハイフンがあると購入できないこと' do
      @order.phone = '03-0000-0000'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone is number only [10-11]')
    end

    it '電話番号が12桁だと購入できないこと' do
      @order.phone = '012345678901'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone is number only [10-11]')
    end
  end
end
