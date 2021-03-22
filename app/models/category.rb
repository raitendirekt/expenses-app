class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'パーソナルケア' },
    { id: 3, name: 'メディア' },
    { id: 4, name: 'レジャー' },
    { id: 5, name: '交通' },
    { id: 6, name: '交際費' },
    { id: 7, name: '住宅' },
    { id: 8, name: '医療・健康' },
    { id: 9, name: '文具' },
    { id: 10, name: '外食' },
    { id: 11, name: '温泉' },
    { id: 12, name: '子供' },
    { id: 13, name: '手数料' },
    { id: 14, name: '投資' },
    { id: 15, name: '教育' },
    { id: 16, name: '水道光熱費' },
    { id: 17, name: '税金' },
    { id: 18, name: '買い物' },
    { id: 19, name: '贈り物' },
    { id: 20, name: '住宅設備' },
    { id: 21, name: '車' },
    { id: 22, name: '通信' },
    { id: 23, name: '保険' },
    { id: 24, name: '食費' },
    { id: 25, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :expenses
  
end