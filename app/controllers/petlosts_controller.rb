class PetlostsController < ApplicationController
  def index
    @petlosts = Petlost.all
  end

  def show
    @petlost = Petlost.find(params[:id])
  end

  def destroy
    @petlost = Petlost.find(params[:id])
    @petlost.destroy
    redirect_to petlosts_path, status: :see_other
  end
end
