class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, :birthday, presence: true
  with_options presence: true do
    validates :email, format: { with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "メールアドレスには@を入力してください"}
    validates :password, format: { with:/.{6,}/, message: "パスワードは6文字以上入力してください。"}
    validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "パスワードは英数字混合で入力してください。"}
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "お名前(全角)は全角で入力してください。"}
    validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "お名前カナ(全角)は全角カタカナで入力して下さい。"}
  end

end
