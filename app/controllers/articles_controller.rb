class ArticlesController < ApplicationController

include ArticlesHelper

def new
   @article = Article.new
end

def index
	@articles = Article.all
  @tag = Tag.all
end

def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id

end

 

   def create
        @article = Article.new(article_params)
        @article.save
       

        flash.notice = "Article '#{@article.title}' Posted!"
        redirect_to article_path(@article)
  end



  def destroy
  	 @article = Article.find(params[:id])
  	 @article.destroy

  	 redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

     redirect_to article_path(@article)
  end

  def user_params
  params.require(:user).permit(:image)
  end

  
end
