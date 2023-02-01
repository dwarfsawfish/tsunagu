class Sorting < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '求職者向け記事' },
    { id: 3, name: '企業向け記事' },
  ]

  include ActiveHash::Associations
  has_many :articles

  end