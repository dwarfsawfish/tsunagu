class Admin::ArticlesController < ApplicationController
  before_action :if_not_admin

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
  end

  def destroy
  end


  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def article_params
    params.permit(:title, :content, :sorting_id).merge(user_id: current_user.id)
  end
end
