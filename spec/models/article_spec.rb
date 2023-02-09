require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.create(:article)
  end

  describe '企業の新規登録ができる' do
    context '新規登録できる場合' do
      it 'すべての情報が正しく入力されていれば登録できる' do
        expect(@article).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'titleが空では登録できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空では登録できない' do
        @article.content = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Content can't be blank")
      end

      it '記事選択カテゴリーが1では登録できない' do
        @article.sorting_id = "1"
        @article.valid?
        expect(@article.errors.full_messages).to include("Sorting can't be blank")
      end

      it 'ユーザーIDが空では登録できない' do
        @article.user_id = ""
        @article.valid?
        expect(@article.errors.full_messages).to include("User must exist")
      end
    end
  end

end
