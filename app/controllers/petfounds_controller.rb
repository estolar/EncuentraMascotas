class PetfoundsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @petfounds = policy_scope(Petfound)

    # Filtros
    if params[:raza].present?
      @petfounds = @petfounds.where("breed ILIKE ?", "%#{params[:raza]}%")
    end

    if params[:color].present?
      @petfounds = @petfounds.where("color ILIKE ?", "%#{params[:color]}%")
    end

    if params[:signs].present?
      @petfounds = @petfounds.where("signs ILIKE ?", "%#{params[:signs]}%")
    end

    if params[:day_found].present?
      @petfounds = @petfounds.where(day_found: params[:day_found])
    end

    if params[:type_pet].present?
      @petfounds = @petfounds.where("LOWER(type_pet) LIKE ?", "%#{params[:type_pet].downcase}%")
    end

    # Paginación
    @petfounds = @petfounds.page(params[:page]).per(6)
  end

  def show
    @petfound = Petfound.find(params[:id])
    authorize @petfound
    @marker = {
      lat: @petfound.latitude,
      lng: @petfound.longitude,
      info_window_html: render_to_string(partial: "info_window_found", locals: { petfound: @petfound })
    }
  end

  def destroy
    @petfound = Petfound.find(params[:id])
    authorize @petfound
    @petfound.destroy
    redirect_to petfounds_path, status: :see_other
  end

  def new
    @petfound = Petfound.new
    authorize @petfound
  end

  def create
    @petfound = Petfound.new(petfound_params)
    authorize @petfound
    if @petfound.save
      redirect_to petfound_path(@petfound)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @petfound = Petfound.find(params[:id])
    authorize @petfound
  end

  def update
    @petfound = Petfound.find(params[:id])
    authorize @petfound
    @petfound.update(petfound_params)
    redirect_to petfound_path(@petfound)
  end

  def user_pets_founds
    authorize :petfound, :user_pets_founds?
    @petfounds = Petfound.all
    @petfounds = current_user.petfound.page(params[:page]).per(6)
  end

  private

  def petfound_params
    params.require(:petfound).permit(:type_pet, :breed, :gender, :facts, :signs, :details, :day_found, :user_id, :address, photos: [], color: [])
  end
end
