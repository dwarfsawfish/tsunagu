require 'rails_helper'

RSpec.describe "offers/show", type: :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
      first_name: "First Name",
      last_name: "Last Name",
      email: "Email",
      age: 2,
      postage_id: 3,
      city: "City",
      house_number: "House Number",
      building: "Building",
      phone_number: "Phone Number",
      academic_career: "Academic Career",
      work_history: "MyText",
      appeal: "MyText",
      user_id: nil,
      job_id: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/House Number/)
    expect(rendered).to match(/Building/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Academic Career/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
