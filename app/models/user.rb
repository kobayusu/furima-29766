class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, :family_name, :first_name, :family_kana, :first_kana, :birth_day, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message:'半角英数字混合であり、＠を使用してください'}

  validates :password, presence: true, length: { minimum: 6}, format: { with: /\A[a-z0-9]+\z/i, message:'半角英数字混合で作成してください' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '平仮名・カタカナ・漢字を全角で記入してください' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナで記入してください' } do
    validates :family_kana
    validates :first_kana
  end
end
