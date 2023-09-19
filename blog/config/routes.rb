Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "articles#index"   # 将路由 / 设置为 articles#index。这样访问主页直接会映射到 articles#index

  # 声明 GET /articles 请求映射到 ArticlesController 的 index 操作（方法）。
  #get "/articles", to: "articles#index"
  # 显示单篇文章，映射到 ArticlesController 的 show 方法 
  #get "/articles/:id", to: "articles#show"    

  # Rails 提供了一个名为 resources 的方法，映射资源集合（例如文章）的所有常规路由。现在将上面两个 get 路由替换为 resources ： 
  # resources 方法还设置 URL 和路径辅助方法，我们可以使用它们来防止代码依赖于特定的路由配置。上面“前缀”列中的值加上后缀 _url 或 _path 形成这些助手的名称。例如，当给定一篇文章时， article_path 帮助器返回 "/articles/#{article.id}" 。我们可以用它来整理 app/views/articles/index.html.erb 中的链接
  resources :articles   # 会包含 articles 所有的常规路由（包括 add、delete等），所以，不安全

  # Defines the root path route ("/")
  # root "articles#index"
end
