class OfferMailerPreview < ActionMailer::Preview
  def offer_mail(offer)
    @offer = offer
    mail to: @offer.job.company.email, subject: "応募のお知らせ"
  end
end
