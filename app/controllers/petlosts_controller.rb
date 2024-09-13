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

    if params[:raza].present?
      @petlosts = @petlosts.where("breed ILIKE ?", "%#{params[:raza]}%")
    end

    if params[:color].present?
      @petlosts = @petlosts.where("color ILIKE ?", "%#{params[:color]}%")
    end

    if params[:signs].present?
      @petlosts = @petlosts.where("signs ILIKE ?", "%#{params[:signs]}%")
    end

    if params[:day_lost].present?
      @petlosts = @petlosts.where(day_lost: params[:day_lost])
    end
  end

  def show
    @petlost = Petlost.find(params[:id])
    @marker = {
      lat: @petlost.latitude,
      lng: @petlost.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { petlost: @petlost })
    }
  end

  def destroy
    @petlost = Petlost.find(params[:id])
    @petlost.destroy
    redirect_to petlosts_path, status: :see_other
  end

  def loading_screen
  end

  def nearby
    @petlosts = Petlost.geocoded
    respond_to do |format|
      format.html
    end
  end

  private

  def petlost_params
    params.require(:petlost).permit(:name, :breed, :color, :signs, :day_lost, :user_id, :finded, :address, photos: [])
  end
end
