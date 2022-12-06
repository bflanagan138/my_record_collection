require 'rails_helper'

RSpec.describe 'Band index page' do
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

  describe 'when I visit the /bands page' do
    it 'shows the name of each band' do
      visit "/bands"
      
      expect(page).to have_content(@band_1.name)
      expect(page).to have_content(@band_2.name)
      expect(page).to have_content(@band_3.name)
    end
  end

  describe 'when I visit /bands/:id/records' do
    it 'shows all records and their attributes for the band id' do
      visit "/bands/#{@band_1.id}/records"
      
      expect(page).to have_content(@band_1.name)
      expect(page).to have_content(@record_1.title)
      expect(page).to have_content(@record_2.format_size)
      expect(page).to_not have_content(@record_7.title)
      expect(page).to have_content(@record_3.color_vinyl)
    end
  end

  describe 'when I visit the /bands/:id page' do
    it 'shows the bands ordered by most recently created first and I can see when it was created' do
      visit "/bands"

      expect(page).to have_content(@band_1.created_at)
      expect(@band_3.name).to appear_before(@band_1.name)
      expect(@band_2.name).to_not appear_before(@band_3.name)
    end
  end
  
  describe 'when I visit any page' do
    it 'contains a link to the /records page' do
      visit "/bands"
      expect(page).to have_link("Records")
    end
  end


# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
  describe 'when I visit a band record index page' do
    it 'shows add a record link' do
      visit "/bands/#{@band_1.id}/records"

      expect(page).to have_link("Add a #{@band_1.name} Record to my Collection")
    end
  end

  describe 'when I click on add a record link' do
    it 'takes me to the add record form' do
  
      visit "/bands/#{@band_1.id}/records"
     
      click_link("Add a #{@band_1.name} Record to my Collection")
      expect(current_path).to eq("/bands/#{@band_1.id}/records/new")
      # require 'pry'; binding.pry
    end
  end
end