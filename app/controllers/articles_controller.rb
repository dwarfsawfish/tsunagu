class ArticlesController < ApplicationController

  before_action :only_admin, only: [:new]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end


  private
  def only_admin
    unless user_signd_in? && current_user.admin?
      redirect_to action: :index
    end
  end
end
