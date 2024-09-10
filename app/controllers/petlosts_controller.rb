class PetlostsController < ApplicationController
  def new
    @petlost = Petlost.new
  end

  def create
    @petlost = Petlost.new(petlost_params)
    if @petlost.save
      redirect_to service_path(@petlost)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @petlost = Petlost.find(params[:id])
  end

  def update
    @petlost = Petlost.find(params[:id])
    @petlost.update(petlost_params)
    redirect_to petlost_path(@petlost)
  end
end
