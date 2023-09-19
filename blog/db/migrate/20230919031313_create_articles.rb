class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|  # 默认情况下，create_table 会自动为表添加一个自增的 id 列，作为主键
      t.string :title
      t.text :body

      t.timestamps  # 这里是对 t.timestamps 的调用。此方法定义了两个名为 created_at 和 updated_at 的附加列。这也是默认的
    end
  end
end
