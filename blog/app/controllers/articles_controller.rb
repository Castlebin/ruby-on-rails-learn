class ArticlesController < ApplicationController
  def index
    @articles = Article.all   # Article 继承了 ApplicationRecord，所以也有 all 方法
  end

  def show
    @article = Article.find(params[:id])
  end

  # new 和 create 是配合工作的，所以一般都成套出现
  # new 操作实例化一篇新文章，但不保存它。本文将在构建表单时在视图中使用。
  # 默认情况下， new 操作将渲染 app/views/articles/new.html.erb
  # 当我们访问 http://localhost:3000/articles/new 时， GET /articles/new 请求会映射到 new 操作。 new 操作不会尝试保存 @article 。因此，不会检查验证，并且不会出现错误消息。
  def new
    @article = Article.new
  end

  # create 操作使用标题和正文值实例化一篇新文章，并尝试保存它。
  # 如果文章保存成功，该操作会将浏览器重定向到位于 "http://localhost:3000/articles/#{@article.id}" 的文章页面。
  # 否则，该操作将通过呈现 app/views/articles/new.html.erb 来重新显示表单，状态代码为 422 无法处理的实体。
  # 当我们提交表单时， POST /articles 请求将映射到 create 操作。 create 操作确实尝试保存 @article 。因此，需要检查验证。如果任何验证失败， @article 将不会被保存，并且 app/views/articles/new.html.erb 将呈现错误消息。
  def create
    @article = Article.new(article_params)  # 使用 article_params 作参数校验，只允许传递 article_params 定义的参数

    if @article.save
      redirect_to @article  # 创建成功后，重定向到这篇文章的详情页
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 更新资源与创建资源非常相似。它们都是多步骤过程。首先，用户请求一个表单来编辑数据。然后，用户提交表单。如果没有错误，则资源将被更新。否则，表单将重新显示并显示错误消息，并重复该过程。
  # 这些步骤通常由控制器的 edit 和 update 操作来处理
  # edit 操作从数据库中获取文章，并将其存储在 @article 中，以便在构建表单时使用。默认情况下， edit 操作将呈现 app/views/articles/edit.html.erb 。
  def edit
    @article = Article.find(params[:id])
  end

  # update 操作从数据库中（重新）获取文章，并尝试使用经 article_params 过滤的提交表单数据进行更新。如果没有验证失败并且更新成功，则该操作会将浏览器重定向到文章的页面。否则，该操作将通过渲染 app/views/articles/edit.html.erb 重新显示表单（带有错误消息）。
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 使用 article_params 做参数校验
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
