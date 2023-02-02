class JobsController < ApplicationController

  def index
    @jobs = Job.includes(:company)
  end

  def new
    @job = Job.new
  end


end
