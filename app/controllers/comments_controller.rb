
class CommentsController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  
  def create
      binding.pry
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
  end
  
    # snippet for brevity
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end


  
