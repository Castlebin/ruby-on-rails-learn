class Article < ApplicationRecord
  validates :title, presence: true    # title 必须存在
  validates :body, presence: true, length: { minimum: 10 }  # body 必须存在，长度最少要有 10 
end
