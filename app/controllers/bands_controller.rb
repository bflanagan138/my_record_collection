class BandsController < ApplicationController
  def index
    @bands = Band.all.order(:created_at).reverse
  end

  def show  
    @band = Band.find(params[:id])
  end

  def new
  end

  def create
    band = Band.create(bands_params)
    redirect_to "/bands"
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    band = Band.find(params[:id])
    band.update(bands_params)
    redirect_to "/bands/#{band.id}"
  end

  private 
  def bands_params
    params.permit(:name, :year_formed, :active)
  end
end