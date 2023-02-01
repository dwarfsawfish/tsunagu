class Admin::ArticlesController < ApplicationController
  before_action :if_not_admin
  before_action :find_article

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @article.update(article_params)
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    end
  end


  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def article_params
    params.permit(:title, :content, :sorting_id).merge(user_id: current_user.id)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
