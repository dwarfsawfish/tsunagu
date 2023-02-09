class Company < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  has_many :jobs, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :category_id,    numericality: { other_than: 1, message: "can't be blank" }
        validates :prefecture_id , numericality: { other_than: 1, message: "can't be blank" }
        

        with_options presence: true do
          validates :company_name
          validates :city
          validates :house_number
          validates :first_name,                format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
          validates :last_name,                 format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
          validates :password,              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
        end
end
