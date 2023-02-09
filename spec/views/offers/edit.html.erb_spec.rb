require 'rails_helper'

RSpec.describe "offers/edit", type: :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      age: 1,
      postage_id: 1,
      city: "MyString",
      house_number: "MyString",
      building: "MyString",
      phone_number: "MyString",
      academic_career: "MyString",
      work_history: "MyText",
      appeal: "MyText",
      user_id: nil,
      job_id: nil
    ))
  end

  it "renders the edit offer form" do
    render

    assert_select "form[action=?][method=?]", offer_path(@offer), "post" do

      assert_select "input[name=?]", "offer[first_name]"

      assert_select "input[name=?]", "offer[last_name]"

      assert_select "input[name=?]", "offer[email]"

      assert_select "input[name=?]", "offer[age]"

      assert_select "input[name=?]", "offer[postage_id]"

      assert_select "input[name=?]", "offer[city]"

      assert_select "input[name=?]", "offer[house_number]"

      assert_select "input[name=?]", "offer[building]"

      assert_select "input[name=?]", "offer[phone_number]"

      assert_select "input[name=?]", "offer[academic_career]"

      assert_select "textarea[name=?]", "offer[work_history]"

      assert_select "textarea[name=?]", "offer[appeal]"

      assert_select "input[name=?]", "offer[user_id_id]"

      assert_select "input[name=?]", "offer[job_id_id]"
    end
  end
end
