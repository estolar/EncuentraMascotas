class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @petlosts = Petlost.all
  end

  def app_info
    # Puedes agregar aquí cualquier lógica adicional si la necesitas.
  end

  def terms
  end

  def privacy
  end
end
