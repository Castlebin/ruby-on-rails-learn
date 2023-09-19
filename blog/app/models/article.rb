class Article < ApplicationRecord
  include Visible

  #has_many :comments  # 在 Article 侧，增加对 Article 的关联。表示一个 Article 可以有多个 Comment
  has_many :comments, dependent: :destroy    # 删除文章时，关联删除关联的评论 

  validates :title, presence: true    # title 必须存在
  validates :body, presence: true, length: { minimum: 10 }  # body 必须存在，长度最少要有 10
end
