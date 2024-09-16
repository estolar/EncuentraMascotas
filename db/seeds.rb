require 'open-uri'

Address.destroy_all
Petfound.destroy_all
Petlost.destroy_all
User.destroy_all

# Crear usuarios individualmente y adjuntar las imágenes de perfil
user1 = User.new(email: 'victorhuatucov@gmail.com', password: '123456', name: 'Victor Huatuco', phone_number: '943053632')
file1 = URI.open("https://res.cloudinary.com/dhfv2yrux/image/upload/v1726246388/development/plsmg0x2iti5he2f6itpmjbufn2m.png")
user1.photo.attach(io: file1, filename: "avatar.png", content_type: "image/png")
user1.save

user2 = User.new(email: 'pamelamc23@gmail.com', password: '123456', name: 'Pamela Matías', phone_number: '949195838')
file2 = URI.open("https://res.cloudinary.com/dhfv2yrux/image/upload/v1726481548/pamela_tszf7g.jpg")
user2.photo.attach(io: file2, filename: "avatar.png", content_type: "image/png")
user2.save

user3 = User.new(email: 'gslazar96@gmail.com', password: '123456', name: 'Gustavo Salazar', phone_number: '941455221')
file3 = URI.open("https://res.cloudinary.com/dhfv2yrux/image/upload/v1726246392/development/6awylfov2eqz2z7qgyy6idde7i3h.png")
user3.photo.attach(io: file3, filename: "avatar.png", content_type: "image/png")
user3.save

user4 = User.new(email: 'enrique7stolar@gmail.com', password: '123456', name: 'Enrique Stolar', phone_number: '969758460')
file4 = URI.open("https://res.cloudinary.com/dhfv2yrux/image/upload/v1726481309/yo_vvkviu.jpg")
user4.photo.attach(io: file4, filename: "avatar.png", content_type: "image/png")
user4.save

user5 = User.new(email: 'luis@example.com', password: '123546', name: 'Luis Gorrion', phone_number: '943053632')
user5.save

puts "Usuarios creados y con imágenes adjuntas: #{[user1, user2, user3, user4, user5].inspect}"

# Crear perros perdidos con 3 imágenes directamente
petlost1 = Petlost.new(name: 'Max', finded: false, breed: 'Labrador Retriever', color: ['Negro'].to_json, signs: 'Collar rojo', day_lost: Date.today - 5, user: user1, address: 'Avenida Arequipa 120, Miraflores, Lima')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726257430/development/rj57bxeownyl3qagbvl9g1ewl7x4.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726257816/development/qu5mjkzsllihwxq5ql6uemrfbxr5.jpg')
petlost1.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost1.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost1.save

petlost2 = Petlost.new(name: 'Bella', finded: false, breed: 'Beagle', color: ['Marrón', 'blanco'].to_json, signs: 'Orejas largas', day_lost: Date.today - 10, user: user2, address: 'Avenida Arequipa 670, Miraflores, Lima')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259357/perrito_encontrado3_ukgfj1.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259356/perrito_encontrado32_bdjk6y.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259355/perrito_encontrado34_zsgda0.jpg')
petlost2.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost2.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost2.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost2.photos.attach(io: file4, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost2.save

petlost3 = Petlost.new(name: 'Rocky', finded: false, breed: 'Otros', color: ['Gris'].to_json, signs: 'Cicatriz en la pata', day_lost: Date.today - 7, user: user3, address: 'Avenida Javier Prado 1340, Surco, Lima')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259516/perrito_encontrado4_pmzwca.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259517/perrito_encontrado42_y4rudy.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259518/perrito_encontrado41_orujo6.jpg')
petlost3.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost3.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost3.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost3.save

petlost4 = Petlost.new(name: 'Lucy', finded: false, breed: 'Golden Retriever', color: ['Dorado'].to_json, signs: 'Pelaje brillante', day_lost: Date.today - 3, user: user4, address: 'Calle Santa Catalina 570, Cercado, Arequipa')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259751/perrito_encontrado52_bz3csp.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259752/perrito_encontrado5_dxkq5n.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259754/perrito_encontrado53_hc8rbz.jpg')
petlost4.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost4.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost4.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost4.save

petlost5 = Petlost.new(name: 'Buddy', finded: false, breed: 'Pug', color: ['Blanco'].to_json, signs: 'Pequeño tamaño', day_lost: Date.today - 12, user: user5, address: 'Calle Santa Catalina 320, Cercado, Arequipa')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726265219/development/3i9eue3vgtpmbo4p4mkny94unr8p.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726265221/development/61a80rwtcx452h5lgoq953lb8dmx.jpg')
petlost5.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost5.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost5.save

puts "Perros perdidos creados y con imágenes adjuntas"


#######################################################################################
# Crear perros encontrados con 3 imágenes directamente
petfound1 = Petfound.new(details: "Lo vi cerca de la avenida y se veía perdido", breed: 'Labrador Retriever', color: ['Negro'].to_json, signs: 'Tenia algo rojo en el cuello', day_found: Date.today - 5, user: user1, address: 'Avenida Arequipa 1234, Miraflores, Lima', facts: "le estoy dando refugio! :)")
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258763/perrito_perdido13_cujt6q.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258764/perrito_perdido12_qfkh46.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258764/perrito_perdido1_bfq1ok.jpg')
petfound1.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound1.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound1.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petfound1.save

petound2 = Petfound.new(details: "Estaba asustado y corriendo", breed: 'Beagle', color: ['Marrón', 'blanco'].to_json, signs: 'Era pequeño', day_found: Date.today - 10, user: user2, address: 'Avenida Arequipa 230, Miraflores, Lima', facts: "solo lo vi mientras pasaba :(")
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258793/perrito_perdido22_dghkuv.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258793/perrito_perdido23_hvnsn1.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258793/perrito_perdido2_tq8utc.jpg')
petound2.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petound2.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petound2.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petound2.save

petfound3 = Petfound.new(details: "Estaba durmiendo", breed: 'Otros', color: ['Gris'].to_json, signs: 'Cojeaba un poco', day_found: Date.today - 7, user: user3, address: 'Avenida Javier Prado 940, Surco, Lima', facts: "solo lo vi mientras pasaba :(")
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258827/perrito_perdido32_krotow.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258827/perrito_perdido31_pi5m7a.jpg')
petfound3.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound3.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound3.save

petfound4 = Petfound.new(details: "Estaba corriendo todo el rato y se fue para el sur", breed: 'Golden Retriever', color: ['Dorado'].to_json, signs: 'Pelo largo y brillante', day_found: Date.today - 3, user: user4, address: 'Calle Santa Catalina, Cercado, Arequipa', facts: "Otras circunstancias")
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258859/perrito_perdido42_baxcxc.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258859/perrito_perdido4_xw3ohh.jpg')
petfound4.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound4.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound4.save

petfound5 = Petfound.new(details: "Estaba durmiendo en acera", breed: 'Otros', color: ['Blanco'].to_json, signs: 'Pequeño', day_found: Date.today - 12, user: user5, address: 'Calle Santa Catalina 120, Cercado, Arequipa', facts: "le estoy dando refugio! :)")
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258946/perrito_perdido5_sfjovt.jpg')
petfound5.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound5.save

puts "Perros encontrados creados y con imágenes adjuntas"
