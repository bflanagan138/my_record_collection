require 'rails_helper'

RSpec.describe 'Band creation' do
  it 'links to new page from band index' do
    visit '/bands'

    click_link 'Add New Band'
    expect(current_path).to eq('/bands/new')
  end

  it 'creates a new band when form is filled out and submitted' do
    visit '/bands/new'
    fill_in('name', with: 'From Ashes Rise')
    fill_in('year_formed', with: 1997)
    choose('active', :with => 'false')
    click_button('Add Band')

    expect(current_path).to eq ("/bands")
    expect(page).to have_content ("From Ashes Rise")
  end
end