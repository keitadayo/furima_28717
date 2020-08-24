class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  
  at_sign = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  chara_6_more = /.{6,}/
  mix_case = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  zenkaku = /\A[ぁ-んァ-ン一-龥]+\z/
  zenkaku_kana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :email, format: { with: at_sign, message: 'メールアドレスには@を入力してください' }
    validates :password, format: { with: chara_6_more, message: 'パスワードは6文字以上入力してください。' }
    validates :password, format: { with: mix_case, message: 'パスワードは英数字混合で入力してください。' }
    validates :first_name, :last_name, format: { with: zenkaku, message: 'お名前(全角)は全角で入力してください。' }
    validates :first_name_kana, :last_name_kana, format: { with: zenkaku_kana, message: 'お名前カナ(全角)は全角カタカナで入力して下さい。' }
  end
end
