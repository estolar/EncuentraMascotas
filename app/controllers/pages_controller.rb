class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    authorize :page, :home?
    @petlosts = Petlost.limit(4)
    @petfounds = Petfound.limit(4)
    @reviews = Review.select('DISTINCT ON (user_id) *')
    .order('user_id, created_at DESC')
    .limit(5)
  end
  # @found_pets = Petfound.all # Carga todas las mascotas encontradas
  def app_info
  end

  def terms
  end

  def privacy
  end
end
