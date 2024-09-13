class PetfoundsController < ApplicationController
  def index
    @petfounds = Petfound.all
  end

  def show
    @petfound = Petfound.find(params[:id])
    @marker = {
      lat: @petfound.latitude,
      lng: @petfound.longitude,
      info_window_html: render_to_string(partial: "info_window_found", locals: { petfound: @petfound })
    }
  end

  def destroy
    @petfound = Petfound.find(params[:id])
    @petfound.destroy
    redirect_to petfounds_path, status: :see_other
  end

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
    params.require(:petfound).permit(:breed, :facts, :signs, :details, :day_found, :user_id, :address , photos: [], color: [])
  end
end
