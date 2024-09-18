class PetlostsController < ApplicationController
  def new
    @petlost = Petlost.new
    authorize @petlost
  end

  def create
    @petlost = Petlost.new(petlost_params)
    authorize @petlost
    if @petlost.save
      redirect_to petlost_path(@petlost)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @petlost = Petlost.find(params[:id])
    authorize @petlost
  end

  def update
    @petlost = Petlost.find(params[:id])
    authorize @petlost
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
    @petlosts = policy_scope(Petlost)

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

    @petlosts = @petlosts.page(params[:page]).per(6)
  end

  def show
    @petlost = Petlost.find(params[:id])
    authorize @petlost
  end

  def destroy
    @petlost = Petlost.find(params[:id])
    authorize @petlost
    @petlost.destroy
    redirect_to petlosts_path, status: :see_other
  end

  def loading_screen
    authorize :petlost, :loading_screen?
  end

  def nearby
    authorize :petlost, :nearby?
    @petlosts = Petlost.geocoded
    respond_to do |format|
      format.html
    end
  end

  def user_pets_losts
    authorize :petlost, :user_pets_losts?
    @petlosts = Petlost.all
    @petlosts = current_user.petlost.page(params[:page]).per(6)
  end

  private

  def petlost_params
    params.require(:petlost).permit(:name, :gender, :type_pet, :breed, :signs, :day_lost, :address, :user_id, :finded, photos: [], color: [])
  end
end
