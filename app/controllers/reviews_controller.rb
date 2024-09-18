class ReviewsController < ApplicationController
  # Asegúrate de que Pundit está incluido en tu controlador
  include Pundit

  # Si necesitas que todas las acciones requieran autorización
  after_action :verify_authorized, except: :index

  def create
    @review = Review.new(review_params)
    @review.user = current_user  # Asociar la opinión al usuario actual

    # Autoriza la operación de creación de un review
    authorize @review

    if @review.save
      redirect_to root_path  # Puedes cambiar la redirección según lo necesites
    else
      redirect_to root_path, alert: "Hubo un error al enviar tu opinión."
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
