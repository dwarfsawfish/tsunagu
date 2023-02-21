class Job < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :company
  belongs_to :occupation
  belongs_to :status
  has_many :offers, dependent: :destroy
  has_many_attached :images


  validates :occupation_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id ,      numericality: { other_than: 1, message: "can't be blank" }


  with_options presence: true do
    validates :work
    validates :representative_message
    validates :appeal
    validates :training
    validates :license
    validates :age
    validates :qualification
    validates :salary
    validates :trial_salary
    validates :time
    validates :holiday
    validates :benefit
    validates :benefit_supplement
    validates :emvironment
    validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  end

  
end
