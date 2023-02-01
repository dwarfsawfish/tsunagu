class Article < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sorting
  belongs_to :user
  
  validates :title, :content,        presence: true  
  validates :sorting_id ,    numericality: { other_than: 1, message: "can't be blank" }
end
