class ReviewsController < ApplicationController
  include Pundit

  after_action :verify_authorized, except: :index

  def create
    @review = Review.new(review_params)
    @review.user = current_user  # Asociar la opinión al usuario actual

    # Autoriza la operación de creación de un review
    authorize @review

    petlost = Petlost.find(params[:petlost_id]) # Asegúrate de que el petlost_id esté presente en el formulario

    if @review.save
      petlost.update(finded: true)  # Actualizar el campo 'finded' a true
      redirect_to root_path, notice: "Tu opinión ha sido registrada correctamente."
    else
      redirect_to root_path, alert: "Hubo un error al enviar tu opinión."
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)  # Asegúrate de permitir el campo :rating
  end
end
