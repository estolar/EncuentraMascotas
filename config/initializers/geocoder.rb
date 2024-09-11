Geocoder.configure(
  # Geocoding options
  timeout: 3,                   # Tiempo de espera para la petición
  lookup: :mapbox,              # Usar el servicio de geocodificación de Mapbox
  api_key: ENV['MAPBOX_API_KEY'],  # API Key de Mapbox, obtenida desde el archivo .env
  units: :km,                   # Usar kilómetros en lugar de millas
  use_https: true               # Usar HTTPS para las solicitudes
)
