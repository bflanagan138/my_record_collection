# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
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
    choose('currently_active', :with => 'false')
    click_button('Add Band')

    expect(current_path).to eq ("/bands")
    expect(page).to have_content ("From Ashes Rise")
  end
end