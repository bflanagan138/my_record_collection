require 'rails_helper'

RSpec.describe 'Band show page' do
  before :each do
    @band_1 = Band.create!(name: "Tragedy", year_formed: 2000, active: false)
    @band_2 = Band.create!(name: "Nine Shocks Terror", year_formed: 1996, active: false)
    @band_3 = Band.create!(name: "Pink Turns Blue", year_formed: 1985, active: true)
    @record_1 = @band_1.records.create!(title: "S/T", format_size: 12, release_year: 2000, color_vinyl: true)
    @record_2 = @band_1.records.create!(title: "Can We Call This Life?", format_size: 7, release_year: 2001, color_vinyl: false)
    @record_3 = @band_1.records.create!(title: "Vengeance", format_size: 12, release_year: 2000, color_vinyl: false)
    @record_4 = @band_2.records.create!(title: "Mobile Terror Unit", format_size: 7, release_year: 1996, color_vinyl: false)
    @record_5 = @band_2.records.create!(title: "Zen and the Art...", format_size: 12, release_year: 1996, color_vinyl: true)
    @record_6 = @band_3.records.create!(title: "If Two Worlds Kiss", format_size: 12, release_year: 1987, color_vinyl: true)
    @record_7 = @band_3.records.create!(title: "Meta", format_size: 12, release_year: 1988, color_vinyl: false)
  end
  it 'shows the band and band attributes when I visit /bands/:id' do
    visit "/bands/#{@band_1.id}"
    
    expect(page).to have_content(@band_1.name)
    expect(page).to have_content(@band_1.year_formed)
    expect(page).to have_content(@band_1.active)
    expect(page).to_not have_content(@band_2.name)
    expect(page).to_not have_content(@band_3.year_formed)
  end
  it 'shows how many records a band has in my collection when I visit /bands/:id' do
    visit "/bands/#{@band_1.id}"
    
    expect(page).to have_content(@band_1.name)
    expect(page).to have_content('I have 3 Tragedy records in my collection')
    
  end
end