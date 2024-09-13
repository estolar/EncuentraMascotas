class PetlostsController < ApplicationController
  def new
    @petlost = Petlost.new
  end

  def create
    @petlost = Petlost.new(petlost_params)
    if @petlost.save
      redirect_to petlost_path(@petlost)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @petlost = Petlost.find(params[:id])
  end

  def update
    @petlost = Petlost.find(params[:id])
    if @petlost.update(petlost_params.except(:photos))
      if params[:petlost][:photos].present?
        params[:petlost][:photos].each do |photo|
          @petlost.photos.attach(photo)
        end
      end
    else
      @petlost.update(petlost_params.except(:photos))
    end
    redirect_to petlost_path(@petlost)
  end

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

  private

  def petlost_params
    params.require(:petlost).permit(:name, :breed, :signs, :day_lost, :address, :user_id, :finded, photos: [], color: [])
  end
end
