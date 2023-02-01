class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '製造' },
    { id: 3, name: '商社' },
    { id: 4, name: '小売' },
    { id: 5, name: '金融' },
    { id: 6, name: 'サービス' },
    { id: 7, name: 'マスコミ' },
    { id: 8, name: 'ソフトウェア・通信' },
    { id: 9, name: 'その他' }
  ]

    include ActiveHash::Associations
    has_many :companies

  end
