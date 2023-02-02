class JobsController < ApplicationController

  def index
    @jobs = Job.includes(:company)
  end

  def new
    @job = Job.new
  end

  private
  def job_params
    params.require(:job).permit(:occupation_id, :status_id, :work, :training, :license, :age,
       :work_area, :salary, :trial_salary, :time, :holiday, :benefit, :benefit_supplement,
       :qualification, :emvironment, :representative_message, :appeal, :image)

end
