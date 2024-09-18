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
    @petlosts = policy_scope(Petlost).where(finded: false) # Filtrar solo los que no han sido encontrados
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

  def download
    @petlost = Petlost.find(params[:format])
    authorize :petlost, :user_pets_losts?

    pdf = Prawn::Document.new

    page_width = pdf.bounds.width
    page_height = pdf.bounds.height

    background_image_url = "https://res.cloudinary.com/dqx97scli/image/upload/v1726694895/Flyer_empresa_de_energ%C3%ADa_renovable_moderno_profesional_verde_2_ampeaa.png"
    background_image_data = URI.open(background_image_url).read
    background_image = StringIO.new(background_image_data)

    pdf.image background_image, at: [0, page_height], width: page_width, height: page_height, position: :center

    pdf.bounding_box([0, page_height], width: page_width) do

      pdf.move_down 150
      large_image_width = page_width * 0.7
      small_image_width = (page_width * 0.9 - 30) / 2
      image_height = 250
      small_image_height = 250

      if @petlost.photos.count == 1
        large_photo = @petlost.photos.first
        large_photo_data = large_photo.download
        large_image = StringIO.new(large_photo_data)
        pdf.image large_image, width: large_image_width, height: image_height, position: :center
        pdf.move_down 10

     elsif @petlost.photos.count >= 2
        small_photos = @petlost.photos.limit(2)
        small_photos_width = small_image_width * small_photos.size + 20 * (small_photos.size - 1)
        start_x = (page_width - small_photos_width) / 2

        pdf.bounding_box([0, pdf.cursor], width: page_width, height: small_image_height) do
          small_photos.each_with_index do |photo, index|
            photo_data = photo.download
            small_image = StringIO.new(photo_data)
            x_position = start_x + index * (small_image_width + 20)
            pdf.image small_image, width: small_image_width, height: small_image_height, at: [x_position, pdf.cursor]
          end
        end
        pdf.move_down 10
      else
        pdf.text "No hay fotos disponibles.", align: :center
        pdf.move_down 10
      end


      pdf.text "Nombre: #{@petlost.name}", size: 24, style: :bold, align: :center
      pdf.move_down 10

      pdf.text "<b>Raza:</b> #{@petlost.breed}", size: 16, inline_format: true, align: :center
      pdf.text "<b>Color:</b> #{JSON.parse(@petlost.color).reject(&:blank?).join(", ")}", size: 16, inline_format: true, align: :center
      pdf.text "<b>Señales Distintivas:</b> #{@petlost.signs}", size: 16, inline_format: true, align: :center
      pdf.text "<b>Día en que se perdió:</b> #{@petlost.day_lost.strftime('%d de %B de %Y')}", size: 16, inline_format: true, align: :center
      pdf.text "<b>Dirección:</b> #{@petlost.address}", size: 16, inline_format: true, align: :center

      pdf.move_down 10
      pdf.text "Si tienes información sobre #{@petlost.name}, por favor contacta al siguiente número:", size: 16, style: :italic, align: :center
      pdf.text @petlost.user.phone_number, size: 18, style: :bold, align: :center
    end
    send_data(pdf.render,
    filename: "#{@petlost.name}-cartel-de-búsqueda.pdf",
      type: 'application/pdf')
  end


  def preview
    @petlost = Petlost.find(params[:format])
    authorize :petlost, :user_pets_losts?

    pdf = Prawn::Document.new

    page_width = pdf.bounds.width
    page_height = pdf.bounds.height

    background_image_url = "https://res.cloudinary.com/dqx97scli/image/upload/v1726694895/Flyer_empresa_de_energ%C3%ADa_renovable_moderno_profesional_verde_2_ampeaa.png"
    background_image_data = URI.open(background_image_url).read
    background_image = StringIO.new(background_image_data)

    pdf.image background_image, at: [0, page_height], width: page_width, height: page_height, position: :center

    pdf.bounding_box([0, page_height], width: page_width) do

      pdf.move_down 150
      large_image_width = page_width * 0.7
      small_image_width = (page_width * 0.9 - 30) / 2
      image_height = 250
      small_image_height = 250

      if @petlost.photos.count == 1
        large_photo = @petlost.photos.first
        large_photo_data = large_photo.download
        large_image = StringIO.new(large_photo_data)
        pdf.image large_image, width: large_image_width, height: image_height, position: :center
        pdf.move_down 10

     elsif @petlost.photos.count >= 2
        small_photos = @petlost.photos.limit(2)
        small_photos_width = small_image_width * small_photos.size + 20 * (small_photos.size - 1)
        start_x = (page_width - small_photos_width) / 2

        pdf.bounding_box([0, pdf.cursor], width: page_width, height: small_image_height) do
          small_photos.each_with_index do |photo, index|
            photo_data = photo.download
            small_image = StringIO.new(photo_data)
            x_position = start_x + index * (small_image_width + 20)
            pdf.image small_image, width: small_image_width, height: small_image_height, at: [x_position, pdf.cursor]
          end
        end
        pdf.move_down 10
      else
        pdf.text "No hay fotos disponibles.", align: :center
        pdf.move_down 10
      end


      pdf.text "Nombre: #{@petlost.name}", size: 24, style: :bold, align: :center
      pdf.move_down 10

      pdf.text "<b>Raza:</b> #{@petlost.breed}", size: 16, inline_format: true, align: :center
      pdf.text "<b>Color:</b> #{JSON.parse(@petlost.color).reject(&:blank?).join(", ")}", size: 16, inline_format: true, align: :center
      pdf.text "<b>Señales Distintivas:</b> #{@petlost.signs}", size: 16, inline_format: true, align: :center
      pdf.text "<b>Día en que se perdió:</b> #{@petlost.day_lost.strftime('%d de %B de %Y')}", size: 16, inline_format: true, align: :center
      pdf.text "<b>Dirección:</b> #{@petlost.address}", size: 16, inline_format: true, align: :center

      pdf.move_down 10
      pdf.text "Si tienes información sobre #{@petlost.name}, por favor contacta al siguiente número:", size: 16, style: :italic, align: :center
      pdf.text @petlost.user.phone_number, size: 18, style: :bold, align: :center
    end
    send_data(pdf.render,
      filename: "#{@petlost.name}-cartel-de-búsqueda.pdf",
      type: 'application/pdf',
      disposition: 'inline')
  end


  def rescued_pets
    @petlosts = policy_scope(Petlost).where(finded: true).page(params[:page]).per(6) # Solo los que han sido rescatados
    authorize :petlost, :rescued_pets? # Asegúrate de autorizar la acción si usas Pundit
  end

  private

  def petlost_params
    params.require(:petlost).permit(:name, :gender, :type_pet, :breed, :signs, :day_lost, :address, :user_id, :finded, photos: [], color: [])
  end
end
