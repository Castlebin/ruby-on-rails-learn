class Comment < ApplicationRecord
  belongs_to :article     # 生成的对 Article 的关联，表示一个 Comment 一定属于一个 Article 

  # 增加对 status 字段的校验
  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }  # status 的值必须是 VALID_STATUSES 中之一

  def archived?
    status == 'archived'
  end
end
