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
    
    describe 'when I visit a band page' do
      it 'shows update band info link' do
        visit "/bands/#{@band_1.id}"

        expect(page).to have_link("Update #{@band_1.name} Info")
      end
    end
    describe 'when I click on update band link' do
      it 'takes me to the band update form' do
    
        visit "/bands/#{@band_1.id}"
       
        click_link("Update #{@band_1.name} Info")
        expect(current_path).to eq("/bands/#{@band_1.id}/edit")
        # require 'pry'; binding.pry
      end
    end
    describe 'fill out band update form and submit' do
      it 'updates band information and returns me to the band show page' do
        visit "/bands/#{@band_1.id}/edit"
        expect(page).to have_content("#{@band_1.name}")
        
        fill_in('name', with: 'The Tragedies')
        fill_in('year_formed', with: 1985)
        # choose('active', :with => 'true')
        click_button('Update Band Info')

        expect(current_path).to eq ("/bands/#{@band_1.id}")
        expect(page).to have_content ("The Tragedies")
        expect(page).to have_content ("1985")
        expect(page).to_not have_content ("Tragedy")
      end
    end
  end