class ArticlesController < ApplicationController
  def index
    @articles = Article.all   # Article 继承了 ApplicationRecord，所以也有 all 方法
  end

  def show
    @article = Article.find(params[:id])
  end
end
