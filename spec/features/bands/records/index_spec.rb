require 'rails_helper'
#user story 1
RSpec.describe 'Band index page' do
  before :each do
    @band_1 = Band.create!(name: "Tragedy", year_formed: 2000, active: false)
    @band_2 = Band.create!(name: "Nine Shocks Terror", year_formed: 1996, active: false)
    @band_3 = Band.create!(name: "Pink Turns Blue", year_formed: 1985, active: true)
  end
  it 'shows the name of each band when I visit /bands ' do
    visit "/bands"
    
    expect(page).to have_content(@band_1.name)
    expect(page).to have_content(@band_2.name)
    expect(page).to have_content(@band_3.name)
  end
end