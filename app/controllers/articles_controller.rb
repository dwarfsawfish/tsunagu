class ArticlesController < ApplicationController

  before_action :if_not_admin, only: [:new, :edit]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end


  private
  def if_not_admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_path
    end
  end
end
