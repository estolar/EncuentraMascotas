require 'open-uri'

Address.destroy_all
Petfound.destroy_all
Petlost.destroy_all
User.destroy_all

# Crear usuarios individualmente y adjuntar las imágenes de perfil
user1 = User.new(email: 'victorhuatucov@gmail.com', password: '123456', name: 'Victor Huatuco', phone_number: '943053632')
file1 = URI.open("https://res.cloudinary.com/dqx97scli/image/upload/v1726245018/victor_dnrjqz.png")
user1.photo.attach(io: file1, filename: "avatar.png", content_type: "image/png")
user1.save

user2 = User.new(email: 'pamelamc23@gmail.com', password: '123456', name: 'Pamela Matías', phone_number: '949195838')
file2 = URI.open("https://res.cloudinary.com/dqx97scli/image/upload/v1726245018/Pamela_zdalre.png")
user2.photo.attach(io: file2, filename: "avatar.png", content_type: "image/png")
user2.save

user3 = User.new(email: 'gslazar96@gmail.com', password: '123456', name: 'Gustavo Salazar', phone_number: '941455221')
file3 = URI.open("https://res.cloudinary.com/dqx97scli/image/upload/v1726245018/gustavo_rgm2kj.png")
user3.photo.attach(io: file3, filename: "avatar.png", content_type: "image/png")
user3.save

user4 = User.new(email: 'enrique7stolar@gmail.com', password: '123456', name: 'Enrique Stolar', phone_number: '969758460')
file4 = URI.open("https://res.cloudinary.com/dqx97scli/image/upload/v1726180273/development/xcpqaf6zmnmygc31q6dp0rx7nd2m.png")
user4.photo.attach(io: file4, filename: "avatar.png", content_type: "image/png")
user4.save

user5 = User.new(email: 'luis@example.com', password: '123546', name: 'Luis Example', phone_number: '3344556677')
user5.save

puts "Usuarios creados y con imágenes adjuntas: #{[user1, user2, user3, user4, user5].inspect}"

# Crear perros perdidos con 3 imágenes directamente
petlost1 = Petlost.new(name: 'Max', finded: false, breed: 'Labrador Retriever', color: 'Negro', signs: 'Collar rojo', day_lost: Date.today - 5, user: user1, address: 'Avenida Arequipa 1234, Miraflores, Lima')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost1.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost1.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost1.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost1.save

petlost2 = Petlost.new(name: 'Bella', finded: false, breed: 'Beagle', color: 'Marrón y blanco', signs: 'Orejas largas', day_lost: Date.today - 10, user: user2, address: 'Avenida Arequipa, Miraflores, Lima')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost2.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost2.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost2.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost2.save

petlost3 = Petlost.new(name: 'Rocky', finded: false, breed: 'Bulldog Francés', color: 'Gris', signs: 'Cicatriz en la pata', day_lost: Date.today - 7, user: user3, address: 'Jirón Puno, Santiago, Cusco')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost3.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost3.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost3.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost3.save

petlost4 = Petlost.new(name: 'Lucy', finded: false, breed: 'Golden Retriever', color: 'Dorado', signs: 'Pelaje brillante', day_lost: Date.today - 3, user: user4, address: 'Calle Santa Catalina, Cercado, Arequipa')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost4.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost4.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost4.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost4.save

petlost5 = Petlost.new(name: 'Buddy', finded: false, breed: 'Pug', color: 'Blanco', signs: 'Pequeño tamaño', day_lost: Date.today - 12, user: user5, address: 'Avenida Pardo, Trujillo, La Libertad')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petlost5.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost5.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost5.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost5.save

puts "Perros perdidos creados y con imágenes adjuntas"


#######################################################################################
# Crear perros encontrados con 3 imágenes directamente
petfound1 = Petfound.new(details: "Tenia algo rojo en el cuello", breed: 'Labrador Retriever', color: 'Negro', signs: 'Tenia algo rojo en el cuello', day_found: Date.today - 5, user: user1, address: 'Avenida Arequipa 1234, Miraflores, Lima', facts: "")
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petfound1.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound1.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound1.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petfound1.save

petound2 = Petfound.new(finded: false, breed: 'Beagle', color: 'Marrón y blanco', signs: 'Orejas largas', day_lost: Date.today - 10, user: user2, address: 'Avenida Arequipa, Miraflores, Lima')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petound2.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petound2.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petound2.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petound2.save

petfound3 = Petfound.new(finded: false, breed: 'Bulldog Francés', color: 'Gris', signs: 'Cicatriz en la pata', day_lost: Date.today - 7, user: user3, address: 'Jirón Puno, Santiago, Cusco')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petfound3.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound3.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound3.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petfound3.save

petfound4 = Petfound.new(finded: false, breed: 'Golden Retriever', color: 'Dorado', signs: 'Pelaje brillante', day_lost: Date.today - 3, user: user4, address: 'Calle Santa Catalina, Cercado, Arequipa')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petfound4.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound4.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound4.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petfound4.save

petfound5 = Petfound.new(finded: false, breed: 'Pug', color: 'Blanco', signs: 'Pequeño tamaño', day_lost: Date.today - 12, user: user5, address: 'Avenida Pardo, Trujillo, La Libertad')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726181452/development/e7gzcjsdprja15wssklcjmqpnarb.jpg')
petfound5.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound5.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound5.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petfound5.save

puts "Perros encontrados creados y con imágenes adjuntas"
