class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '事務・管理' },
    { id: 3, name: '企画・マーケティング' },
    { id: 4, name: '営業' },
    { id: 5, name: '技術・研究' },
    { id: 6, name: '販売・サービス' },
    { id: 7, name: 'クリエイティブ' },
    { id: 8, name: 'IT' },
    { id: 9, name: '医療・福祉' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :jobs

  end