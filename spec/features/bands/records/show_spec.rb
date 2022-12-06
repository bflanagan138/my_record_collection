require 'rails_helper'

RSpec.describe 'Band and records show page' do
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

# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
  describe 'visit child show page' do
    it 'has link to update child' do
      visit "/records/#{@record_2.id}"
      expect(page).to have_content("Can We Call This Life?")
      expect(page).to_not have_content("Mobile Terror Unit")
      expect(page).to have_link("Update This Release")
    end
  end
 
  it 'when I click the Update Release link' do
    visit "/records/#{@record_2.id}"
    click_link ("Update This Release")
    expect(current_path).to eq("/records/#{@record_2.id}/edit")
  end

  it 'updates record when form is filled out and submitted' do
    visit "/records/#{@record_2.id}/edit"
    fill_in('title', with: 'We Cannot Call This Life')
    fill_in('format_size', with: 12)
    fill_in('release_year', with: 2019)
    # choose('color_vinyl', :with => 'false')
    click_button('Update Record Info')

    expect(current_path).to eq ("/records/#{@record_2.id}")
    expect(page).to have_content ("We Cannot Call This Life")
  end
end