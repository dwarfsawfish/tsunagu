class OffersController < ApplicationController

  before_action :if_not_login, only: [:new]


  def new
    @job = Job.find(params[:job_id])
    @offer = Offer.new
  end

  def create
    @job = Job.find(params[:job_id])
    @offer = Offer.new(offer_params)
    if @offer.save
      OfferMailer.offer_mail(@offer).deliver
      redirect_to job_path(@job), notice: 'Offer was successfully created.'
    else 
      render :new
    end
  end


  private
    def offer_params
      params.require(:offer).permit(:first_name, :last_name, :email, :age, :prefecture_id, :city, :house_number,
        :building, :phone_number, :academic_career, :work_history, :appeal)
        .merge(user_id: current_user.id, job_id: @job.id)
    end

    def if_not_login
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end
end
