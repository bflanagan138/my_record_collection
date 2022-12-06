class BandRecordsController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @records = @band.records
  end

  def new
    @band = Band.find(params[:id])
  end

  def create
    @band = Band.find(params[:id])
    @records = @band.records.create!(band_records_params)
    redirect_to "/bands/#{@band.id}/records"
  end

  private 
  def band_records_params
    params.permit(:title, :format_size, :release_year, :color_vinyl, :band_id)
  end
end