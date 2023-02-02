class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '正社員' },
    { id: 3, name: '契約社員' },
    { id: 4, name: 'アルバイト・パート' },
    { id: 5, name: '派遣社員' },
    { id: 6, name: '委託・請負' },
  ]

  include ActiveHash::Associations
  has_many :jobs

  end