class BandRecordsController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @records = @band.records
  end
end