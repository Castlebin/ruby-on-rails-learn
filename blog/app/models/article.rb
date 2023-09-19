class Article < ApplicationRecord
  has_many :comments  # 在 Article 侧，增加对 Article 的关联。表示一个 Article 可以有多个 Comment

  validates :title, presence: true    # title 必须存在
  validates :body, presence: true, length: { minimum: 10 }  # body 必须存在，长度最少要有 10 
end
