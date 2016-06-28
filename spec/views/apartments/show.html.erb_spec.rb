require 'rails_helper'

RSpec.describe "apartments/show", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "Address",
      :name => "Name",
      :contact => "Contact",
      :bed => 1.5,
      :bath => 1.5,
      :price => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Description/)
  end
end
