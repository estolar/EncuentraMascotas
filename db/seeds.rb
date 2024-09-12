
Address.destroy_all
Petfound.destroy_all
Petlost.destroy_all
User.destroy_all


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

users = User.create!([
  { email: 'juan@example.com', password: 'password' },
  { email: 'maria@example.com', password: 'password' },
  { email: 'carlos@example.com', password: 'password' },
  { email: 'ana@example.com', password: 'password' },
  { email: 'luis@example.com', password: 'password' },
  { email: 'claudia@example.com', password: 'password' },
  { email: 'victorhuatucov@gmail.com', password: '123456' },
  { email: 'pamelamc23@gmail.com', password: '123456' },
  { email: 'gslazar96@gmail.com', password: '123456' },
  { email: 'enrique7stolar@gmail.com', password: '123456' }
])


puts "Usuarios creados: #{users.inspect}"



# Crear perros perdidos
petlosts = Petlost.create!([
  { name: 'Max', finded: true, breed: 'Labrador Retriever', color: 'Negro', signs: 'Collar rojo', day_lost: Date.today - 5, user: users[0], address: 'Avenida Arequipa 1234, Miraflores, Lima' },
  { name: 'Bella', finded: true, breed: 'Beagle', color: 'Marrón y blanco', signs: 'Orejas largas', day_lost: Date.today - 10, user: users[1], address: 'Avenida Arequipa, Miraflores, Lima' },
  { name: 'Rocky', finded: true, breed: 'Bulldog Francés', color: 'Gris', signs: 'Cicatriz en la pata', day_lost: Date.today - 7, user: users[2], address: 'Jirón Puno, Santiago, Cusco' },
  { name: 'Lucy', finded: true, breed: 'Golden Retriever', color: 'Dorado', signs: 'Pelaje brillante', day_lost: Date.today - 3, user: users[3], address: 'Calle Santa Catalina, Cercado, Arequipa' },
  { name: 'Buddy', finded: true, breed: 'Pug', color: 'Blanco', signs: 'Pequeño tamaño', day_lost: Date.today - 12, user: users[4], address: 'Avenida Pardo, Trujillo, La Libertad' },
  { name: 'Shadow', finded: false, breed: 'Shih Tzu', color: 'Negro', signs: 'Collar rojo', day_lost: Date.today - 5, user: users[0], address: 'Calle 28 de julio, Miraflores, Lima' },
  { name: 'Charlie', finded: false, breed: 'Schnauzer', color: 'Marrón y blanco', signs: 'Orejas largas', day_lost: Date.today - 10, user: users[1], address: 'Avenida Arequipa, Miraflores, Lima' },
  { name: 'Duke', finded: false, breed: 'Boxer', color: 'Gris', signs: 'Cicatriz en la pata', day_lost: Date.today - 7, user: users[2], address: 'Jirón Puno, Santiago, Cusco' },
  { name: 'Bailey', finded: false, breed: 'Otros', color: 'Dorado', signs: 'Pelaje brillante', day_lost: Date.today - 3, user: users[3], address: 'Calle Santa Catalina, Cercado, Arequipa' },
  { name: 'Coco', finded: false, breed: 'Otros', color: 'Blanco', signs: 'Pequeño tamaño', day_lost: Date.today - 12, user: users[4], address: 'Avenida Pardo, Trujillo, La Libertad' }
])

puts "Perros perdidos creados: #{petlosts.inspect}"



# Crear perros encontrados
petfounds = Petfound.create!([
  { details: 'Encontrado en buen estado', breed: 'Labrador Retriever', color: 'Negro', signs: 'Collar rojo', day_found: Date.today - 5, user: users[0], address: 'Avenida Arequipa 1234, Miraflores, Lima' },
  { details: 'Parece estar perdido hace poco', breed: 'Beagle', color: 'Marrón y blanco', signs: 'Orejas largas', day_found: Date.today - 10, user: users[1], address: 'Avenida Arequipa, Miraflores, Lima' },
  { details: 'Un poco asustado pero en buen estado', breed: 'Bulldog Francés', color: 'Gris', signs: 'Cicatriz en la pata', day_found: Date.today - 7, user: users[2], address: 'Jirón Puno, Santiago, Cusco' },
  { details: 'Parece bien cuidado, tiene buen pelaje', breed: 'Golden Retriever', color: 'Dorado', signs: 'Pelaje brillante', day_found: Date.today - 3, user: users[3], address: 'Calle Santa Catalina, Cercado, Arequipa' },
  { details: 'Muy amistoso', breed: 'Pug', color: 'Blanco', signs: 'Pequeño tamaño', day_found: Date.today - 12, user: users[4], address: 'Avenida Pardo, Trujillo, La Libertad' },
  { details: 'Encontrado en buen estado pero parece extraviado', breed: 'Shih Tzu', color: 'Negro', signs: 'Collar rojo', day_found: Date.today - 5, user: users[0], address: 'Calle 28 de julio, Miraflores, Lima' },
  { details: 'Parece haber sido perdido hace poco', breed: 'Schnauzer', color: 'Marrón y blanco', signs: 'Orejas largas', day_found: Date.today - 10, user: users[1], address: 'Avenida Arequipa, Miraflores, Lima' },
  { details: 'Encontrado cerca de un parque', breed: 'Boxer', color: 'Gris', signs: 'Cicatriz en la pata', day_found: Date.today - 7, user: users[2], address: 'Jirón Puno, Santiago, Cusco' },
  { details: 'Parece bien alimentado', breed: 'Otros', color: 'Dorado', signs: 'Pelaje brillante', day_found: Date.today - 3, user: users[3], address: 'Calle Santa Catalina, Cercado, Arequipa' },
  { details: 'Muy amigable', breed: 'Otros', color: 'Blanco', signs: 'Pequeño tamaño', day_found: Date.today - 12, user: users[4], address: 'Avenida Pardo, Trujillo, La Libertad' }
])

puts "Perros encontrados creados: #{petfounds.inspect}"
