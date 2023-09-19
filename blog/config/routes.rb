Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # 声明 GET /articles 请求映射到 ArticlesController 的 index 操作（方法）。
  get "/articles", to: "articles#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
