require 'rails_helper'

RSpec.describe 'Band show page' do
  before :each do
    @band_1 = Band.create!(name: "Tragedy", year_formed: 2000, active: false)
    @band_2 = Band.create!(name: "Nine Shocks Terror", year_formed: 1996, active: false)
    @band_3 = Band.create!(name: "Pink Turns Blue", year_formed: 1985, active: true)
  end
  it 'shows the band and band attributes when I visit /bands/:id' do
    visit "/bands/#{@band_1.id}"
    
    expect(page).to have_content(@band_1.name)
    expect(page).to have_content(@band_1.year_formed)
    expect(page).to have_content(@band_1.active)
    expect(page).to_not have_content(@band_2.name)
    expect(page).to_not have_content(@band_3.year_formed)
  end
end