class PetfoundsController < ApplicationController
  def new
    @petfound = Petfound.new
  end

  def create
    @petfound = Petfound.new(petfound_params)
    if @petfound.save
      redirect_to petfound_path(@petfound)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @petfound = Petfound.find(params[:id])
  end

  def update
    @petfound = Petfound.find(params[:id])
    @petfound.update(petfound_params)
    redirect_to petfound_path(@petfound)
  end

  private

  def petfound_params
    params.require(:petfound).permit(:breed, :facts, :signs, :details, :day_found, :user_id, photos: [], color: [])
  end
end
