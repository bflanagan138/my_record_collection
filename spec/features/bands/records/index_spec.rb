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
  before :each do
    @record_1 = @band_1.records.create!(title: "S/T", format_size: 12, release_year: 2000, color_vinyl: true)
    @record_2 = @band_1.records.create!(title: "Can We Call This Life?", format_size: 7, release_year: 2001, color_vinyl: false)
    @record_3 = @band_1.records.create!(title: "Vengeance", format_size: 12, release_year: 2000, color_vinyl: false)
    @record_4 = @band_2.records.create!(title: "Mobile Terror Unit", format_size: 7, release_year: 1996, color_vinyl: false)
    @record_5 = @band_2.records.create!(title: "Zen and the Art...", format_size: 12, release_year: 1996, color_vinyl: true)
    @record_6 = @band_3.records.create!(title: "If Two Worlds Kiss", format_size: 12, release_year: 1987, color_vinyl: true)
    @record_7 = @band_3.records.create!(title: "Meta", format_size: 12, release_year: 1988, color_vinyl: false)
  end

  it 'shows all records and their attributes for the band id' do
    visit "/bands/#{@band_1.id}/records"
    
    expect(page).to have_content(@band_1.name)
    expect(page).to have_content(@record_1.title)
    expect(page).to have_content(@record_2.format_size)
    expect(page).to_not have_content(@record_7.title)
    expect(page).to have_content(@record_3.color_vinyl)
  end
end