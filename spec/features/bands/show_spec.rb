require 'rails_helper'
RSpec.describe "Band Show Page" do
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
  describe 'when I visit any page' do
    it 'contains a link to the /records page' do
      visit "/bands/#{@band_1.id}"

      expect(page).to have_link("Records")
    end
  end
  describe 'when I visit a band show page' do
    it 'contains a link to the bands /records page' do
      visit "/bands/#{@band_1.id}"

      expect(page).to have_link("#{@band_1.name} Records")
      click_link("All #{@band_1.name} Records in my Collection")
      expect(current_path).to eq("/bands/#{@band_1.id}/records")
    end
  end
    
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
    describe 'when I visit a band page' do
      it 'shows update band info link' do
        visit "/bands/#{@band_1.id}"

        expect(page).to have_link("Update #{@band_1.name} Info")
      end
    end
  end