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

  private

  def petfound_params
    params.require(:petfound).permit(:details, :breed, :color, :signs, :day_found, :user_id, :address, photos: [])
  end
end
