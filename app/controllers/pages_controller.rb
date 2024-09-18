class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    authorize :page, :home?
    @petlosts = Petlost.limit(4)
    @petfounds = Petfound.limit(4)
  end
  # @found_pets = Petfound.all # Carga todas las mascotas encontradas
  def app_info
  end

  def terms
  end

  def privacy
  end
end
