class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  # 增加评论，路由到 create 方法
  def create
    @article = Article.find(params[:article_id])  # 需要先定位到要关联的 Article，因为每条评论都得属于一个 Article
    @comment = @article.comments.create(comment_params) # 关联，增加
    redirect_to article_path(@article)   # 完成后，还是重定向到文章页
  end

  # 删除评论，路由到 destory 方法
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
