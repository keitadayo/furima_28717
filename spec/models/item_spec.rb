require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('spec/images/test_image.png')
    end

    it '全ての項目があれば登録できること' do
      expect(@item).to be_valid
    end

    it '画像が空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '説明文が空では登録できないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'カテゴリーが無選択では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it '商品の状態が無選択では登録できないこと' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('State Select')
    end

    it '配送料の負担が無選択では登録できないこと' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee Select')
    end

    it '配送元の地域が無選択では登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end

    it '発送までの日数が無選択では登録できないこと' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day Select')
    end

    it '価格が空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が全角数字では登録できないこと' do
      @item.price = '７７７'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '価格が299では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than 299')
    end

    it '価格が10,000,000では登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 10000000')
    end
  end
end
