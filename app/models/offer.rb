class Offer < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :user
  belongs_to :job


  validates :prefecture_id , numericality: { other_than: 1, message: "can't be blank" }
  
  with_options presence: true do
    validates :city
    validates :house_number
    validates :first_name,                format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name,                 format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :age
    validates :phone_number
    validates :academic_career
    validates :work_history
  end
end
