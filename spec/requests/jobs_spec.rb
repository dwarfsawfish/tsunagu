require 'rails_helper'

RSpec.describe "Jobs", type: :request do

  before do
    @job = FactoryBot.create(:job)
  end

  describe "GET #index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get jobs_path
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスに職種カテゴリーIDが存在する' do
      get jobs_path
      expect(response.body).to include(@job.occupation.name)
    end

    it 'indexアクションにリクエストするとレスポンスに勤務地が存在する' do
      get jobs_path
      expect(response.body).to include(@job.work_area || @job.company.prefecture.name && @job.company.city && @job.company.house_number )
    end

    it 'indexアクションにリクエストするとレスポンスに雇用形態カテゴリーIDが存在する' do
      get jobs_path
      expect(response.body).to include(@job.status.name)
    end

    it 'indexアクションにリクエストするとレスポンスに勤務時間が存在する' do
      get jobs_path
      expect(response.body).to include(@job.time)
    end

    it 'indexアクションにリクエストするとレスポンスに給与が存在する' do
      get jobs_path
      expect(response.body).to include(@job.salary)
    end

    it 'indexアクションにリクエストするとレスポンスに待遇が存在する' do
      get jobs_path
      expect(response.body).to include(@job.benefit)
    end


    it 'indexアクションにリクエストするとレスポンスにアピールポイントが存在する' do
      get jobs_path
      expect(response.body).to include(@job.appeal)
    end

    it 'indexアクションにリクエストするとレスポンスに社名が存在する' do
      get jobs_path
      expect(response.body).to include(@job.company.company_name)
    end
  end


  describe "GET #show" do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get job_path(@job)
      expect(response.status).to eq 200
    end

    it 'showアクションにリクエストするとレスポンスに代表者メッセージが存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.representative_message)
    end

    it 'showアクションにリクエストするとレスポンスに仕事内容が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.work)
    end

    it 'showアクションにリクエストするとレスポンスに育成情報が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.training)
    end

    it 'showアクションにリクエストするとレスポンスに職場の雰囲気が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.emvironment)
    end

    it 'showアクションにリクエストするとレスポンスに給与が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.salary)
    end

    it 'showアクションにリクエストするとレスポンスに試用期間の給与が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.trial_salary)
    end

    it 'showアクションにリクエストするとレスポンスに勤務時間が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.time)
    end

    it 'showアクションにリクエストするとレスポンスに休日が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.holiday)
    end

    it 'showアクションにリクエストするとレスポンスに年齢が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.age)
    end

    it 'showアクションにリクエストするとレスポンスに採用条件が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.qualification)
    end

    it 'showアクションにリクエストするとレスポンスに待遇が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.benefit)
    end

    it 'showアクションにリクエストするとレスポンスに待遇の補足が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.benefit_supplement)
    end

    it 'showアクションにリクエストするとレスポンスに勤務地が存在する' do
      get job_path(@job)
      expect(response.body).to include(@job.work_area || @job.company.prefecture.name && @job.company.city && @job.company.house_number )
    end
  end

end
