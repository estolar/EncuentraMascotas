require 'open-uri'

Address.destroy_all
Petfound.destroy_all
Petlost.destroy_all
User.destroy_all

# Crear usuarios individualmente y adjuntar las imágenes de perfil
user1 = User.new(email: 'victorhuatucov@gmail.com', password: '123456')
file1 = URI.open("https://res.cloudinary.com/dqx97scli/image/upload/v1726245018/victor_dnrjqz.png")
user1.photo.attach(io: file1, filename: "avatar.png", content_type: "image/png")
user1.save

user2 = User.new(email: 'pamelamc23@gmail.com', password: '123456')
file2 = URI.open("https://res.cloudinary.com/dqx97scli/image/upload/v1726245018/Pamela_zdalre.png")
user2.photo.attach(io: file2, filename: "avatar.png", content_type: "image/png")
user2.save

user3 = User.new(email: 'gslazar96@gmail.com', password: '123456')
file3 = URI.open("https://res.cloudinary.com/dqx97scli/image/upload/v1726245018/gustavo_rgm2kj.png")
user3.photo.attach(io: file3, filename: "avatar.png", content_type: "image/png")
user3.save

user4 = User.new(email: 'enrique7stolar@gmail.com', password: '123456')
file4 = URI.open("https://res.cloudinary.com/dqx97scli/image/upload/v1726180273/development/xcpqaf6zmnmygc31q6dp0rx7nd2m.png")
user4.photo.attach(io: file4, filename: "avatar.png", content_type: "image/png")
user4.save

user5 = User.new(email: 'luis@example.com', password: '123546')
user5.save

puts "Usuarios creados y con imágenes adjuntas: #{[user1, user2, user3, user4, user5].inspect}"

# Crear perros perdidos con 3 imágenes directamente
petlost1 = Petlost.new(name: 'Max', finded: true, breed: 'Labrador Retriever', color: 'Negro', signs: 'Collar rojo', day_lost: Date.today - 5, user: user1, address: 'Avenida Arequipa 1234, Miraflores, Lima')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost1.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost1.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost1.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost1.save

petlost2 = Petlost.new(name: 'Bella', finded: true, breed: 'Beagle', color: 'Marrón y blanco', signs: 'Orejas largas', day_lost: Date.today - 10, user: user2, address: 'Avenida Arequipa, Miraflores, Lima')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost2.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost2.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost2.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost2.save

petlost3 = Petlost.new(name: 'Rocky', finded: true, breed: 'Bulldog Francés', color: 'Gris', signs: 'Cicatriz en la pata', day_lost: Date.today - 7, user: user3, address: 'Jirón Puno, Santiago, Cusco')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost3.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost3.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost3.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost3.save

petlost4 = Petlost.new(name: 'Lucy', finded: true, breed: 'Golden Retriever', color: 'Dorado', signs: 'Pelaje brillante', day_lost: Date.today - 3, user: user4, address: 'Calle Santa Catalina, Cercado, Arequipa')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost4.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost4.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost4.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost4.save

petlost5 = Petlost.new(name: 'Buddy', finded: true, breed: 'Pug', color: 'Blanco', signs: 'Pequeño tamaño', day_lost: Date.today - 12, user: user5, address: 'Avenida Pardo, Trujillo, La Libertad')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost5.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost5.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost5.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost5.save

puts "Perros perdidos creados y con imágenes adjuntas"



# users = User.create!([
#   { email: 'juan@example.com', password: 'password', first_name: 'Juan', last_name: 'Perez', address: 'Lima' },
#   { email: 'maria@example.com', password: 'password', first_name: 'Maria', last_name: 'Gomez', address: 'Arequipa' },
#   { email: 'carlos@example.com', password: 'password', first_name: 'Carlos', last_name: 'Garcia', address: 'Cusco' },
#   { email: 'ana@example.com', password: 'password', first_name: 'Ana', last_name: 'Lopez', address: 'Trujillo' },
#   { email: 'luis@example.com', password: 'password', first_name: 'Luis', last_name: 'Martinez', address: 'Piura' },
#   { email: 'claudia@example.com', password: 'password', first_name: 'Claudia', last_name: 'Ramirez', address: 'Iquitos' },
#   { email: 'victorhuatucov@gmail.com', password: '123456', first_name: 'Victor', last_name: 'Huatuco', address: 'Lima' },
#   { email: 'pamelamc23@gmail.com', password: '123456', first_name: 'Pamela', last_name: 'Matias', address: 'Lima' },
#   { email: 'gslazar96@gmail.com', password: '123456', first_name: 'Gustavo', last_name: 'Salazar', address: 'Lima' },
#   { email: 'enrique7stolar@gmail.com', password: '123456', first_name: 'Enrique', last_name: 'Stolar', address: 'Lima'}
# ])
