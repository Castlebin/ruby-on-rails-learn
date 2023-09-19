class Comment < ApplicationRecord
  include Visible

  belongs_to :article     # 生成的对 Article 的关联，表示一个 Comment 一定属于一个 Article
end
