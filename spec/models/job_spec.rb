require 'rails_helper'

RSpec.describe Job, type: :model do
  before do
    @job = FactoryBot.build(:job)
  end

  describe '仕事の新規登録ができる' do
    context '新規登録できる場合' do
      it 'すべての情報が入力されていれば登録できる' do
        expect(@job).to be_valid
      end
    end

    context '新規登録ができない場合' do

      it '職種カテゴリーが1では登録できない' do
        @job.occupation_id = "1"
        @job.valid?
        expect(@job.errors.full_messages).to include("Occupation can't be blank")
      end

      it '雇用形態カテゴリーが1では登録できない' do
        @job.status_id = "1"
        @job.valid?
        expect(@job.errors.full_messages).to include("Status can't be blank")
      end

      it 'work（仕事内容）が空では登録できない' do
        @job.work = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Work can't be blank")
      end


      it 'representative_message（代表者メッセージ）が空では登録できない' do
        @job.representative_message = ""
        @job.valid?
        expect(@job.errors.full_messages).to include("Representative message can't be blank")
      end

      it 'appeal（一言アピール）が空では登録できない' do
        @job.appeal = ""
        @job.valid?
        expect(@job.errors.full_messages).to include("Appeal can't be blank")
      end

      it 'training（研修内容）が空では登録できない' do
        @job.training = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Training can't be blank")
      end

      it 'license（資格）が空では登録できない' do
        @job.license = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("License can't be blank")
      end


      it 'age(年齢)が空では登録できない' do
        @job.age = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Age can't be blank")
      end

      it 'trial_salary(研修中の給与)が空では登録できない' do
        @job.trial_salary = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Trial salary can't be blank")
      end

      it 'time(勤務時間)が空では登録できない' do
        @job.time = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Time can't be blank")
      end

      it 'holiday(休日)が空では登録できない' do
        @job.holiday = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Holiday can't be blank")
      end

      it 'benefit(待遇)が空では登録できない' do
        @job.benefit = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Benefit can't be blank")
      end

      it 'benefit_supplement(待遇の補足)が空では登録できない' do
        @job.benefit_supplement = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Benefit supplement can't be blank")
      end

      it 'emvironment(職場の雰囲気)が空では登録できない' do
        @job.emvironment = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Emvironment can't be blank")
      end
    end
  end
end
