class Admin::ArticlesController < ApplicationController
  before_action :if_not_admin, only: [:new, :edit]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    end
  end


  private
  def if_not_admin
    unless user_signed_in? && current_user.admin?
    redirect_to root_path
    end
  end

  def article_params
    params.permit(:title, :content, :sorting_id).merge(user_id: current_user.id)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
