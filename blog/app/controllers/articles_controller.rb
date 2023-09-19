class ArticlesController < ApplicationController
  def index
    @articles = Article.all   # Article 继承了 ApplicationRecord，所以也有 all 方法
  end

  def show
    @article = Article.find(params[:id])
  end

  # new 操作实例化一篇新文章，但不保存它。本文将在构建表单时在视图中使用。
  # 默认情况下， new 操作将渲染 app/views/articles/new.html.erb
  def new
    @article = Article.new
  end

  # create 操作使用标题和正文值实例化一篇新文章，并尝试保存它。
  # 如果文章保存成功，该操作会将浏览器重定向到位于 "http://localhost:3000/articles/#{@article.id}" 的文章页面。
  # 否则，该操作将通过呈现 app/views/articles/new.html.erb 来重新显示表单，状态代码为 422 无法处理的实体。
  def create
    @article = Article.new(article_params)  # 使用 article_params 作参数校验，只允许传递 article_params 定义的参数

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 使用 article_params 作参数校验
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
