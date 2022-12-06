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
    band = Band.create(name: params[:name])
    redirect_to "/bands"
  end

  def update
    
  end
end