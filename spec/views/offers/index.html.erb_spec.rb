require 'rails_helper'

RSpec.describe "offers/index", type: :view do
  before(:each) do
    assign(:offers, [
      Offer.create!(
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
      ),
      Offer.create!(
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
      )
    ])
  end

  it "renders a list of offers" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "House Number".to_s, count: 2
    assert_select "tr>td", text: "Building".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
    assert_select "tr>td", text: "Academic Career".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
