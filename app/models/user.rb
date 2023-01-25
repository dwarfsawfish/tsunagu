class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :password,              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname,              presence: true
  validates :first_name,            presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name,             presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
