class Article < ApplicationRecord
  has_many :comments  # 在 Article 侧，增加对 Article 的关联。表示一个 Article 可以有多个 Comment

  validates :title, presence: true    # title 必须存在
  validates :body, presence: true, length: { minimum: 10 }  # body 必须存在，长度最少要有 10 

  # 增加对 status 字段的校验
  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }   # status 的值必须是 VALID_STATUSES 中之一

  def archived?
    status == 'archived'
  end
end
