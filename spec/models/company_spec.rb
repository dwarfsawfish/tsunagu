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
        expect(@company.errors.full_messages).to include("Company name can't be blank")
      end

      it '業種カテゴリーが1では登録できない' do
        @company.category_id = "1"
        @company.valid?
        expect(@company.errors.full_messages).to include("Category can't be blank")
      end

      it '都道府県カテゴリーが1では登録できない' do
        @company.prefecture_id = "1"
        @company.valid?
        expect(@company.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村が空では登録できない' do
        @company.city = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @company.house_number = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("House number can't be blank")
      end

      it 'emailが空では登録できない' do
        @company.email = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がないと登録できない' do
        @company.email = 'testtest'
        @company.valid?
        expect(@company.errors.full_messages).to include("Email is invalid")
      end

      it '既存のメールアドレスは登録できない' do
        @company.save
        another_company = FactoryBot.build(:company, email: @company.email)
        another_company.valid?
        expect(another_company.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @company.password = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @company.password = 'aaaaa'
        @company.password_confirmation = @company.password
        @company.valid?
        expect(@company.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @company.password = Faker::Internet.password(min_length: 129)
        @company.password_confirmation = @company.password
        @company.valid?
        expect(@company.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it 'passwordとpassword_confirmationが一致しない' do
        @company.password = 'aaa111'
        @company.password_confirmation = 'bbb111'
        @company.valid?
        expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは半角英数字が混合でないと登録できない' do
        @company.password = 'aaaaaa'
        @company.valid?
        expect(@company.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは数値のみでは登録できない' do
        @company.password = '111111'
        @company.valid?
        expect(@company.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは全角英数字では保存できない' do
        @company.password = 'ＴＴＴ３３３'
        @company.valid?
        expect(@company.errors.full_messages).to include('Password is invalid')
      end

      it 'first_nameが空では登録できない' do
        @company.first_name = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @company.last_name = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが半角カタカナでは登録できない' do
        @company.first_name = 'ﾀﾛｳ'
        @company.valid?
        expect(@company.errors.full_messages).to include("First name is invalid")
      end

      it 'first_nameがローマ字では登録できない' do
        @company.first_name = 'tarou'
        @company.valid?
        expect(@company.errors.full_messages).to include("First name is invalid")
      end

      it 'last_nameが半角カタカナでは登録できない' do
        @company.last_name = 'ﾀﾅｶ'
        @company.valid?
        expect(@company.errors.full_messages).to include('Last name is invalid')
      end

      it 'last_nameがローマ字では登録できない' do
        @company.last_name = 'tanaka'
        @company.valid?
        expect(@company.errors.full_messages).to include('Last name is invalid')
      end
    end
  end
end
