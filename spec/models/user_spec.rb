require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての項目が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードは6文字以上であること" do
      @user.password = "123ab"
      @user.password_confirmation ="123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password パスワードは6文字以上入力してください。")
    end

    it "パスワードは半角英数字混合であること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password パスワードは英数字混合で入力してください。")
    end

    it "ユーザー本名の名字が空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名の名前が空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "ユーザー本名の名字が半角では登録できないこと" do
      @user.first_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name お名前(全角)は全角で入力してください。")
    end

    it "ユーザー本名の名前が半角では登録できないこと" do
      @user.last_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name お名前(全角)は全角で入力してください。")
    end

    it "ユーザー本名の名字カナが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "ユーザー本名の名前カナが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "ユーザー本名の名字フリガナは全角ひらがなでは登録できないこと" do
      @user.first_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana お名前カナ(全角)は全角カタカナで入力して下さい。")
    end

    it "ユーザー本名の名前フリガナは全角ひらがなでは登録できないこと" do
      @user.last_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana お名前カナ(全角)は全角カタカナで入力して下さい。")
    end

    it "生年月日が空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end