class BandsController < ApplicationController
  def index
    @bands = Band.all.order(:created_at).reverse
  end
  def show  
    @band = Band.find(params[:id])
    # require 'pry'; binding.pry
  end
end