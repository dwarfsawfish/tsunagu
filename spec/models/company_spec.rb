require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    @company = FactoryBot.build(:company)
  end

  describe '企業の新規登録ができる' do
    context '新規登録できる場合' do
      it 'すべての情報が入力されていれば登録できる' do
        expect(@company).to be_valid
      end

      it '建物の情報が空欄でも登録できる' do
        @company.building = ""
        expect(@company).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'company_nameが空では登録できない' do
        @company.company_name = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("会社名を入力してください")
      end

      it '業種カテゴリーが1では登録できない' do
        @company.category_id = "1"
        @company.valid?
        expect(@company.errors.full_messages).to include("業種can't be blank")
      end

      it '都道府県カテゴリーが1では登録できない' do
        @company.prefecture_id = "1"
        @company.valid?
        expect(@company.errors.full_messages).to include("都道府県can't be blank")
      end

      it '市町村が空では登録できない' do
        @company.city = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("市町村を入力してください")
      end

      it '番地が空では登録できない' do
        @company.house_number = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("番地を入力してください")
      end

      it 'emailが空では登録できない' do
        @company.email = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailに@がないと登録できない' do
        @company.email = 'testtest'
        @company.valid?
        expect(@company.errors.full_messages).to include("Eメールは不正な値です")
      end

      it '既存のメールアドレスは登録できない' do
        @company.save
        another_company = FactoryBot.build(:company, email: @company.email)
        another_company.valid?
        expect(another_company.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが空では登録できない' do
        @company.password = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが5文字以下では登録できない' do
        @company.password = 'aaaaa'
        @company.password_confirmation = @company.password
        @company.valid?
        expect(@company.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが129文字以上では登録できない' do
        @company.password = Faker::Internet.password(min_length: 129)
        @company.password_confirmation = @company.password
        @company.valid?
        expect(@company.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end

      it 'passwordとpassword_confirmationが一致しない' do
        @company.password = 'aaa111'
        @company.password_confirmation = 'bbb111'
        @company.valid?
        expect(@company.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordは半角英数字が混合でないと登録できない' do
        @company.password = 'aaaaaa'
        @company.valid?
        expect(@company.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordは数値のみでは登録できない' do
        @company.password = '111111'
        @company.valid?
        expect(@company.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordは全角英数字では保存できない' do
        @company.password = 'ＴＴＴ３３３'
        @company.valid?
        expect(@company.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'first_nameが空では登録できない' do
        @company.first_name = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("名を入力してください")
      end

      it 'last_nameが空では登録できない' do
        @company.last_name = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("姓を入力してください")
      end

      it 'first_nameが半角カタカナでは登録できない' do
        @company.first_name = 'ﾀﾛｳ'
        @company.valid?
        expect(@company.errors.full_messages).to include("名は不正な値です")
      end

      it 'first_nameがローマ字では登録できない' do
        @company.first_name = 'tarou'
        @company.valid?
        expect(@company.errors.full_messages).to include("名は不正な値です")
      end

      it 'last_nameが半角カタカナでは登録できない' do
        @company.last_name = 'ﾀﾅｶ'
        @company.valid?
        expect(@company.errors.full_messages).to include('姓は不正な値です')
      end

      it 'last_nameがローマ字では登録できない' do
        @company.last_name = 'tanaka'
        @company.valid?
        expect(@company.errors.full_messages).to include('姓は不正な値です')
      end
    end
  end
end
