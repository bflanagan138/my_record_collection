class RecordsController < ApplicationController
  
  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    record = Record.find(params[:id])
    record.update(records_params)
    redirect_to "/records/#{record.id}"
  end

  private 
  def records_params
    params.permit(:title, :format_size, :release_year, :color_vinyl)
  end
end