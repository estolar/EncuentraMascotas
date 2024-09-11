
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
  { name: 'Max', finded: true, breed: 'Labrador', color: 'Negro', signs: 'Collar rojo', day_lost: Date.today - 5, user: users[0] },
  { name: 'Bella', finded: true, breed: 'Beagle', color: 'Marrón y blanco', signs: 'Orejas largas', day_lost: Date.today - 10, user: users[1] },
  { name: 'Rocky', finded: true, breed: 'Bulldog', color: 'Gris', signs: 'Cicatriz en la pata', day_lost: Date.today - 7, user: users[2] },
  { name: 'Lucy', finded: true, breed: 'Golden Retriever', color: 'Dorado', signs: 'Pelaje brillante', day_lost: Date.today - 3, user: users[3] },
  { name: 'Buddy', finded: true, breed: 'Poodle', color: 'Blanco', signs: 'Pequeño tamaño', day_lost: Date.today - 12, user: users[4] },
  { name: 'Shadow', finded: false, breed: 'Shih zu', color: 'Negro', signs: 'Collar rojo', day_lost: Date.today - 5, user: users[0] },
  { name: 'Charlie', finded: false, breed: 'Schnauzer', color: 'Marrón y blanco', signs: 'Orejas largas', day_lost: Date.today - 10, user: users[1] },
  { name: 'Duke', finded: false, breed: 'Pomerania', color: 'Gris', signs: 'Cicatriz en la pata', day_lost: Date.today - 7, user: users[2] },
  { name: 'Bailey', finded: false, breed: 'Pequines', color: 'Dorado', signs: 'Pelaje brillante', day_lost: Date.today - 3, user: users[3] },
  { name: 'Coco', finded: false, breed: 'Unica', color: 'Blanco', signs: 'Pequeño tamaño', day_lost: Date.today - 12, user: users[4] }
])

puts "Perros perdidos creados: #{petlosts.inspect}"

# Crear perros encontrados
petfounds = Petfound.create!([
  { details: 'Encontrado cerca del parque', breed: 'Labrador', color: 'Negro', signs: 'Collar azul', day_found: Date.today - 1, user: users[0] },
  { details: 'Estaba asustado en la calle', breed: 'Beagle', color: 'Marrón y blanco', signs: 'Orejas largas', day_found: Date.today - 4, user: users[1] },
  { details: 'Muy amigable, con correa', breed: 'Bulldog', color: 'Gris', signs: 'Cicatriz visible', day_found: Date.today - 2, user: users[2] },
  { details: 'Parecía perdido en el centro', breed: 'Golden Retriever', color: 'Dorado', signs: 'Pelaje largo', day_found: Date.today - 3, user: users[3] },
  { details: 'Caminando solo por la avenida', breed: 'Poodle', color: 'Blanco', signs: 'Sin collar', day_found: Date.today - 5, user: users[4] }
])

puts "Perros encontrados creados: #{petfounds.inspect}"
