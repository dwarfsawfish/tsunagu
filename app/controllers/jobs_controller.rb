class JobsController < ApplicationController
  before_action :authenticate_company!, only: [:new, :edit, :destory]
  before_action :find_job, only: [:show, :edit, :destroy, :update]
  before_action :if_not_company, only: [:edit, :destroy]

  def index
    @jobs = Job.includes(:company)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @job.destroy
      redirect_to root_path
    end
  end

  private
  def job_params
    params.require(:job).permit(:occupation_id, :status_id, :work, :training, :license, :age,
       :work_area, :salary, :trial_salary, :time, :holiday, :benefit_supplement,
       :qualification, :emvironment, :representative_message, :appeal,
       :image).merge(benefit: params[:benefit], company_id: current_company.id)
  end

  def if_not_company
    unless company_signed_in? && current_company.id == @job.company_id
      redirect_to root_path
    end
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
