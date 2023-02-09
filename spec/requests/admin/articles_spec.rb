require 'rails_helper'

RSpec.describe "Admin::Articles", type: :request do

  before do
    @article = FactoryBot.create(:article)
  end

  describe "GET #index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get articles_path
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスに記事のtitleが存在する' do
      get articles_path
      expect(response.body).to include(@article.title)
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get article_path(@article)
      expect(response.status).to eq 200
    end

    it 'showアクションにリクエストするとレスポンスに投稿済みの記事のtitleが存在する' do 
      get article_path(@article)
      expect(response.body).to include(@article.title)
    end

    it 'showアクションにリクエストするとレスポンスに投稿済みの記事のcontentが存在する' do 
      get article_path(@article)
      expect(response.body).to include(@article.content)
    end
  end 

  describe "GET #new" do
    it 'newアクションにリクエストすると正常にレスポンスが返ってくる' do
      get new_admin_article_path
      expect(response.status).to eq 200
    end

    it 'newアクションにリクエストするとレスポンスに記事のtitleが存在する' do
      get new_admin_article_path
      expect(response.body).to include(@article.title)
    end
  end
end



