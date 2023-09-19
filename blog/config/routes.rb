Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "articles#index"   # 将路由 / 设置为 articles#index。这样访问主页直接会映射到 articles#index

  # 声明 GET /articles 请求映射到 ArticlesController 的 index 操作（方法）。
  get "/articles", to: "articles#index"
  # 显示单篇文章，映射到 ArticlesController 的 show 方法 
  get "/articles/:id", to: "articles#show"    

  # Defines the root path route ("/")
  # root "articles#index"
end
