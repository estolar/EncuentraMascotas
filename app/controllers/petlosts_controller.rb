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

  def download
    @petlost = Petlost.find(params[:format])
    authorize :petlost, :user_pets_losts?

    pdf = Prawn::Document.new

    # Obtener dimensiones de la página
    page_width = pdf.bounds.width
    page_height = pdf.bounds.height

    # Cargar la imagen de fondo
    background_image_url = "https://res.cloudinary.com/dqx97scli/image/upload/v1726690184/Flyer_empresa_de_energ%C3%ADa_renovable_moderno_profesional_verde_ibr3fn.png"
    background_image_data = URI.open(background_image_url).read
    background_image = StringIO.new(background_image_data)

    # Configurar la imagen de fondo para que cubra toda la página
    pdf.image background_image, at: [0, page_height], width: page_width, height: page_height, position: :center

    # Añadir el contenido sobre el fondo
    pdf.bounding_box([0, page_height], width: page_width) do
      # Título
      pdf.move_down 200

      # Definir tamaños de las imágenes
      large_image_width = page_width * 0.7
      small_image_width = (page_width * 0.7 - 30) / 2
      image_height = 250
      small_image_height = 150

      # Mostrar la imagen grande
      if @petlost.photos.any?
        large_photo = @petlost.photos.first
        large_photo_data = large_photo.download
        large_image = StringIO.new(large_photo_data)
        pdf.image large_image, width: large_image_width, height: image_height, position: :center
        pdf.move_down 10

        # Mostrar hasta 2 imágenes pequeñas debajo de la imagen grande
        small_photos = @petlost.photos.offset(1).limit(2)
        if small_photos.any?
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
          pdf.move_down 10
        end
      else
        pdf.move_down 10
      end

      # Datos del perro
      pdf.text "Nombre: #{@petlost.name}", size: 18, style: :bold
      pdf.text "Raza: #{@petlost.breed}", size: 16
      pdf.text "Color: #{@petlost.color}", size: 16
      pdf.text "Señales Distintivas: #{@petlost.signs}", size: 16
      pdf.text "Día en que se perdió: #{@petlost.day_lost.strftime('%d de %B de %Y')}", size: 16
      pdf.text "Dirección: #{@petlost.address}", size: 16
      pdf.text "Contacto: #{@petlost.user.email}", size: 16
      pdf.move_down 10

      # Instrucciones de contacto
      pdf.text "Si tienes información sobre el paradero de #{@petlost.name}, por favor contacta al siguiente número:", size: 16, style: :italic
      pdf.text @petlost.user.phone_number || "Número de contacto no proporcionado", size: 18, style: :bold
    end

    # Enviar el PDF generado
    send_data(pdf.render,
      filename: 'hello.pdf',
      type: 'application/pdf',
      disposition: 'inline')
  end


  def preview
    @petlost = Petlost.find(params[:format])
    authorize @petlost
  end


  private

  def petlost_params
    params.require(:petlost).permit(:name, :type_pet, :breed, :signs, :day_lost, :address, :user_id, :finded, photos: [], color: [])
  end
end
