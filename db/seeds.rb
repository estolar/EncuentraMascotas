require 'open-uri'

Address.destroy_all
Petfound.destroy_all
Petlost.destroy_all
User.destroy_all

# Crear usuarios individualmente y adjuntar las imágenes de perfil
user1 = User.new(email: 'victorhuatucov@gmail.com', password: '123456', name: 'Victor Huatuco', phone_number: '+51943053632')
file1 = URI.open("https://res.cloudinary.com/dhfv2yrux/image/upload/v1726246388/development/plsmg0x2iti5he2f6itpmjbufn2m.png")
user1.photo.attach(io: file1, filename: "avatar.png", content_type: "image/png")
user1.save

user2 = User.new(email: 'pamelamc23@gmail.com', password: '123456', name: 'Pamela Matías', phone_number: '+51949195838')
file2 = URI.open("https://res.cloudinary.com/dhfv2yrux/image/upload/v1726481548/pamela_tszf7g.jpg")
user2.photo.attach(io: file2, filename: "avatar.png", content_type: "image/png")
user2.save

user3 = User.new(email: 'gslazar96@gmail.com', password: '123456', name: 'Gustavo Salazar', phone_number: '+51941455221')
file3 = URI.open("https://res.cloudinary.com/dhfv2yrux/image/upload/v1726246392/development/6awylfov2eqz2z7qgyy6idde7i3h.png")
user3.photo.attach(io: file3, filename: "avatar.png", content_type: "image/png")
user3.save

user4 = User.new(email: 'enrique7stolar@gmail.com', password: '123456', name: 'Enrique Stolar', phone_number: '+51969758460')
file4 = URI.open("https://res.cloudinary.com/dhfv2yrux/image/upload/v1726481309/yo_vvkviu.jpg")
user4.photo.attach(io: file4, filename: "avatar.png", content_type: "image/png")
user4.save

puts "Usuarios creados y con imágenes adjuntas: #{[user1, user2, user3, user4].inspect}"

# Crear mascotas perdidas
petlost1 = Petlost.new(name: 'Max', finded: false, breed: 'Labrador Retriever', color: ['Dorados'].to_json, signs: 'Tenía un collar negro', day_lost: Date.today - 5, user: user1, address: 'Avenida Arequipa 120, Miraflores, Lima', type_pet: 'Dog', gender: 'Male')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726257430/development/rj57bxeownyl3qagbvl9g1ewl7x4.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726257816/development/qu5mjkzsllihwxq5ql6uemrfbxr5.jpg')
petlost1.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost1.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost1.save

petlost6 = Petlost.new(name: 'Lucy', finded: false, breed: 'Otros', color: ['Crema', 'Negro'].to_json, signs: 'Tenía su ropa rosada favorita', day_lost: Date.today - 3, user: user2, address: 'Calle Santa Catalina 570, Cercado, Arequipa', type_pet: 'Dog', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259751/perrito_encontrado52_bz3csp.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259752/perrito_encontrado5_dxkq5n.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259754/perrito_encontrado53_hc8rbz.jpg')
petlost6.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost6.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost6.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost6.save

petlost2 = Petlost.new(name: 'Mimi', finded: false, breed: 'siamés', color: ['Blanco', 'Negro'].to_json, signs: 'Tiene ojos azules', day_lost: Date.today - 3, user: user2, address: 'Calle Los Pinos 120, Surco, Lima', type_pet: 'Cat', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781917/Mimi1_bmadde.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781917/Mimi2_niwju5.jpg')
file3 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781926/Mimi3_d9qwou.jpg')
petlost2.photos.attach(io: file1, filename: 'gato1.jpg', content_type: 'image/jpg')
petlost2.photos.attach(io: file2, filename: 'gato2.jpg', content_type: 'image/jpg')
petlost2.photos.attach(io: file3, filename: 'gato2.jpg', content_type: 'image/jpg')
petlost2.save


petlost3 = Petlost.new(name: 'Bella', finded: false, breed: 'Beagle', color: ['Marrón', 'blanco'].to_json, signs: 'Tiene las orejas largas', day_lost: Date.today - 10, user: user3, address: 'Avenida La Marina 670, San Miguel, Lima', type_pet: 'Dog', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259357/perrito_encontrado3_ukgfj1.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259356/perrito_encontrado32_bdjk6y.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259355/perrito_encontrado34_zsgda0.jpg')
petlost3.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost3.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost3.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost3.save

petlost4 = Petlost.new(name: 'Rocky', finded: false, breed: 'Otros', color: ['Negro', 'Marrón'].to_json, signs: 'Mi perrito cojea un poco', day_lost: Date.today - 7, user: user4, address: 'Av. Argentina 448, Lima', type_pet: 'Dog', gender: 'Male')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259516/perrito_encontrado4_pmzwca.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259517/perrito_encontrado42_y4rudy.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726259518/perrito_encontrado41_orujo6.jpg')
petlost4.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost4.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost4.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petlost4.save

petlost5 = Petlost.new(name: 'Pechocho', finded: false, breed: 'Otros', color: ['Blanco'].to_json, signs: 'Estaba quieto', day_lost: Date.today - 2, user: user1, address: 'Av. Tomás Valle 671, San Martín de Porres', type_pet: 'Otro', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781926/Pechocho1_mfzhkw.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781926/Pechocho2_snqxgz.jpg')
petlost5.photos.attach(io: file1, filename: 'gato_encontrado1.jpg', content_type: 'image/jpg')
petlost5.photos.attach(io: file2, filename: 'gato_encontrado1.jpg', content_type: 'image/jpg')
petlost5.save

petlost7 = Petlost.new(name: 'Buddy', finded: false, breed: 'Pug', color: ['Crema'].to_json, signs: 'Es pequeño y tiene la cara pequeña', day_lost: Date.today - 12, user: user3, address: 'Calle Santa Catalina 320, Cercado, Arequipa', type_pet: 'Dog', gender: 'Male')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726265219/development/3i9eue3vgtpmbo4p4mkny94unr8p.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726265221/development/61a80rwtcx452h5lgoq953lb8dmx.jpg')
petlost7.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petlost7.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petlost7.save


petlost8 = Petlost.new(name: 'Tita', finded: false, breed: 'bosque de noruega', color: ['Blanco', 'Plomo'].to_json, signs: 'Es delgada', day_lost: Date.today - 3, user: user4, address: 'Av. Cascanueces 103, Santa Anita, Lima', type_pet: 'Cat', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781937/Tita1_s2qjfg.jpg')
petlost8.photos.attach(io: file1, filename: 'gato1.jpg', content_type: 'image/jpg')
petlost8.save

petlost9 = Petlost.new(name: 'Pelusa', finded: false, breed: 'otros', color: ['Blanco', 'mostaza'].to_json, signs: 'Tiene ojos verdes', day_lost: Date.today - 3, user: user1, address: 'Av. Enrique Meiggs 956, Lima', type_pet: 'Cat', gender: 'Male')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781937/Pelusa_fyotwn.jpg')
petlost9.photos.attach(io: file1, filename: 'gato1.jpg', content_type: 'image/jpg')
petlost9.save


petlost10 = Petlost.new(name: 'Pepe', finded: false, breed: 'otros', color: ['Rojo', 'azul', 'amarillo'].to_json, signs: 'Tiene las puntas de las alas azules', day_lost: Date.today - 3, user: user2, address: 'Av. Independencia 1457, Arequipa', type_pet: 'Otro', gender: 'Male')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781935/Pepe3_xesqqm.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781935/Pepe1_oqy52h.jpg')
file3 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781933/Pepe2_ankxyo.jpg')
petlost10.photos.attach(io: file1, filename: 'gato1.jpg', content_type: 'image/jpg')
petlost10.photos.attach(io: file2, filename: 'gato1.jpg', content_type: 'image/jpg')
petlost10.photos.attach(io: file3, filename: 'gato1.jpg', content_type: 'image/jpg')
petlost10.save
puts "Perros perdidos creados y con imágenes adjuntas"


#######################################################################################
# Crear mascotas encontrados
petfound1 = Petfound.new(details: "Lo vi cerca de la avenida y se veía perdido", breed: 'Labrador Retriever', color: ['Negro'].to_json, signs: 'Tenia algo rojo en el cuello', day_found: Date.today - 5, user: user1, address: 'Av. Dolores 132, Arequipa', facts: "le estoy dando refugio! :)", type_pet: 'Dog', gender: 'Male')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258763/perrito_perdido13_cujt6q.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258764/perrito_perdido12_qfkh46.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258764/perrito_perdido1_bfq1ok.jpg')
petfound1.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound1.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound1.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petfound1.save

petound2 = Petfound.new(details: "Estaba asustado y corriendo", breed: 'Beagle', color: ['Marrón', 'blanco'].to_json, signs: 'Era pequeño', day_found: Date.today - 10, user: user2, address: 'Av Pizarro 109, Arequipa', facts: "solo lo vi mientras pasaba :(", type_pet: 'Dog', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258793/perrito_perdido2_tq8utc.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258793/perrito_perdido22_dghkuv.jpg')
file3 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258793/perrito_perdido23_hvnsn1.jpg')
petound2.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petound2.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petound2.photos.attach(io: file3, filename: 'perrito3.jpg', content_type: 'image/jpg')
petound2.save

petfound3 = Petfound.new(details: "Estaba durmiendo", breed: 'Otros', color: ['Gris'].to_json, signs: 'Cojeaba un poco', day_found: Date.today - 7, user: user3, address: 'Av. Venezuela 1920, Lima', facts: "solo lo vi mientras pasaba :(", type_pet: 'Dog', gender: 'Male')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258827/perrito_perdido32_krotow.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258827/perrito_perdido31_pi5m7a.jpg')
petfound3.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound3.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound3.save

petfound4 = Petfound.new(details: "Estaba en un árbol", breed: 'Canario amarillo', color: ['Amarillo'].to_json, signs: 'Se acercaba mucho', day_found: Date.today - 6, user: user4, address: 'Av. de la Marina 2355, San Miguel, Lima', facts: "le estoy dando refugio! :)", type_pet: 'Otro', gender: 'Male')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781916/Estaba_en_un_arbol2_ymm2rp.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781916/Estaba_en_un_arbol_x5svct.jpg')
petfound4.photos.attach(io: file1, filename: 'loro_encontrado1.jpg', content_type: 'image/jpg')
petfound4.photos.attach(io: file2, filename: 'loro_encontrado1.jpg', content_type: 'image/jpg')
petfound4.save


petfound5 = Petfound.new(details: "Estaba corriendo todo el rato y se fue para el sur", breed: 'Golden Retriever', color: ['Dorado'].to_json, signs: 'Tenía el pelo largo y brillante', day_found: Date.today - 3, user: user1, address: 'Av. México 906 14, Lima', facts: "Otras circunstancias", type_pet: 'Dog', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258859/perrito_perdido4_xw3ohh.jpg')
file2 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258859/perrito_perdido42_baxcxc.jpg')
petfound5.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound5.photos.attach(io: file2, filename: 'perrito2.jpg', content_type: 'image/jpg')
petfound5.save

petfound6 = Petfound.new(details: "Lo vi escondido bajo un auto", breed: 'Persa', color: ['Gris'].to_json, signs: 'Parecía asustado', day_found: Date.today - 2, user: user2, address: 'Jiron Las Violetas 432, San Borja, Lima', facts: "solo lo vi mientras pasaba :(", type_pet: 'Cat', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781916/bajo_un_auto2_oegvs8.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726775568/development/b9c8wb3ti9zie21irr60nucr09iv.jpg')
petfound6.photos.attach(io: file1, filename: 'gato_encontrado1.jpg', content_type: 'image/jpg')
petfound6.photos.attach(io: file2, filename: 'gato_encontrado1.jpg', content_type: 'image/jpg')
petfound6.save

petfound9 = Petfound.new(details: "Estaba en un arbol", breed: 'Loro verde', color: ['Verde'].to_json, signs: 'Mi lorito habla bastante', day_found: Date.today - 15, user: user1, address: 'Avenida Los Lirios 980, San Isidro, Lima', facts: "solo lo vi mientras pasaba :(", type_pet: 'Otro', gender: 'Male')
file1 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781917/Imagen_de_WhatsApp_2024-09-19_a_las_11.00.04_f7901738_pwpnwf.jpg')
file2 = URI.open('https://res.cloudinary.com/dhfv2yrux/image/upload/v1726781916/Imagen_de_WhatsApp_2024-09-19_a_las_10.59.41_6d864b08_szfu8q.jpg')
petfound9.photos.attach(io: file1, filename: 'loro1.jpg', content_type: 'image/jpg')
petfound9.photos.attach(io: file2, filename: 'loro2.jpg', content_type: 'image/jpg')
petfound9.save

petfound7 = Petfound.new(details: "Estaba durmiendo en acera", breed: 'Otros', color: ['Blanco', 'Crema'].to_json, signs: 'Era pequeño, con manchas cremas y peludo', day_found: Date.today - 12, user: user3, address: 'Av. Argentina 6236, Lima', facts: "le estoy dando refugio! :)", type_pet: 'Dog', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726258946/perrito_perdido5_sfjovt.jpg')
petfound7.photos.attach(io: file1, filename: 'perrito1.jpg', content_type: 'image/jpg')
petfound7.save

petfound8 = Petfound.new(details: "Lo vi en la pared", breed: 'bengalí', color: ['Multicolor'].to_json, signs: 'Estaba quieto', day_found: Date.today - 2, user: user4, address: 'Av. 28 de Julio N° 932, Lima', facts: "solo lo vi mientras pasaba :(", type_pet: 'Cat', gender: 'Female')
file1 = URI.open('https://res.cloudinary.com/dqx97scli/image/upload/v1726762998/Imagen_de_WhatsApp_2024-09-19_a_las_10.53.56_69fb41b8_ngxe34.jpg')
petfound8.photos.attach(io: file1, filename: 'gato_encontrado1.jpg', content_type: 'image/jpg')
petfound8.save



puts "Perros encontrados creados y con imágenes adjuntas"


# Crear reseñas
review1 = Review.create(content: "Les estoy muy agredecido, me ayudaron a recuperar a mi mascota rápido", user: user1, rating: 5)
review2 = Review.create(content: "Me ayudó mucho los mapas para encontrar a mi mascota, gracias!", user: user3, rating: 4)

puts "Reseñas creadas"

puts "Seed completada con éxito"
