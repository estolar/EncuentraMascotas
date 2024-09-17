class Petlost < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many_attached :photos
  DOGBREEDS = [
    'Affenpinscher', 'Afghan Hound', 'Akita Americano', 'Akita Inu', 'Airedale Terrier',
    'Alaskan Malamute', 'American Eskimo Dog', 'American Foxhound',
    'American Staffordshire Terrier', 'American Water Spaniel', 'Anatolian Shepherd Dog',
    'Appenzeller Sennenhund', 'Azawakh', 'Basenji', 'Basset Hound', 'Beagle',
    'Beauceron', 'Bedlington Terrier', 'Bergamasco', 'Bernese Mountain Dog',
    'Bichón Frisé', 'Bluetick Coonhound', 'Bloodhound', 'Boerboel', 'Bolognese',
    'Border Collie', 'Border Terrier', 'Borzoi', 'Boston Terrier', 'Boxer',
    'Boykin Spaniel', 'Briard', 'Brussels Griffon', 'Bull Terrier', 'Bullmastiff',
    'Bulldog Americano', 'Bulldog Campeiro', 'Bulldog Francés', 'Bulldog Inglés',
    'Cairn Terrier', 'Cane Corso', 'Catahoula Leopard Dog', 'Cavalier King Charles Spaniel',
    'Central Asian Shepherd Dog', 'Chesapeake Bay Retriever', 'Chihuahua', 'Chin Japonés',
    'Chinook', 'Chinese Crested', 'Chow Chow', 'Clumber Spaniel', 'Cocker Spaniel',
    'Corgi', 'Coton de Tulear', 'Criollo', 'Curly-Coated Retriever', 'Dachshund (salchicha)',
    'Dálmata', 'Dandie Dinmont Terrier', 'Doberman Pinscher', 'Dogo Argentino',
    'Dogo de Burdeos', 'Entlebucher Mountain Dog', 'Estrela Mountain Dog',
    'English Coonhound', 'English Foxhound', 'English Setter', 'English Toy Spaniel',
    'English Toy Terrier', 'Eurasier', 'Field Spaniel', 'Fila Brasileño', 'Finnish Lapphund',
    'Finnish Spitz', 'Flat-Coated Retriever', 'Fox Terrier', 'Galgo Español',
    'Glen of Imaal Terrier', 'Golden Retriever',
    'Gordon Setter', 'Grand Basset Griffon Vendéen', 'Greater Swiss Mountain Dog',
    'Greyhound', 'Groenendael', 'Harrier', 'Havanese', 'Hokkaido', 'Husky de Alaska',
    'Icelandic Sheepdog', 'Irish Setter', 'Irish Terrier', 'Irish Water Spaniel',
    'Irish Wolfhound', 'Jack Russell Terrier', 'Japanese Chin', 'Kai', 'Kangal',
    'Kelpie Australiano', 'Keeshond', 'Kerry Blue Terrier', 'Kishu', 'Komondor',
    'Kuvasz', 'Lagotto Romagnolo', 'Leonberger', 'Lhasa Apso', 'Labrador Retriever',
    'Lakeland Terrier', 'Lowchen', 'Löwchen', 'Maltés', 'Manchester Terrier',
    'Maremma Sheepdog', 'Mastín Español', 'Mastín Napolitano', 'Miniature Pinscher',
    'Norfolk Terrier', 'Norwegian Elkhound', 'Norwegian Lundehund', 'Norwich Terrier',
    'Nova Scotia Duck Tolling Retriever', 'Otterhound', 'Papillon', 'Parson Russell Terrier',
    'Pastor Alemán', 'Pastor Australiano', 'Pastor Belga Malinois', 'Pastor Caucásico',
    'Pastor del Cáucaso', 'Pastor de Asia Central', 'Pastor de Shetland', 'Pekingese',
    'Petit Basset Griffon Vendéen', 'Phalène', 'Pharaoh Hound', 'Pitbull Terrier',
    'Plott', 'Pointer Inglés', 'Pomerania', 'Poodle', 'Presa Canario',
    'Perro Crestado Chino', 'Perro Lobo Checoslovaco', 'Perro Lobo de Saarloos',
    'Perro Lobo Italiano', 'Perro de Agua Americano', 'Perro de Agua Español',
    'Perro de Montaña de los Pirineos', 'Perro Sin Pelo', 'Pharaoh Hound',
    'Podenco Canario', 'Podenco Ibicenco', 'Portuguese Podengo', 'Portuguese Podengo Pequeno',
    'Portuguese Water Dog', 'Pug', 'Puli', 'Pyrenean Mastiff', 'Redbone Coonhound',
    'Rhodesian Ridgeback', 'Rottweiler', 'Russell Terrier', 'Samoyed', 'Samoyedo',
    'Schipperke', 'Schnauzer', 'Scottish Terrier', 'Sealyham Terrier', 'Setter Inglés',
    'Setter Irlandés', 'Shar Pei', 'Shiba Inu', 'Shih Tzu', 'Shikoku', 'Siberian Husky',
    'Silky Terrier', 'Skye Terrier', 'Smooth Fox Terrier', 'Spitz Alemán',
    'Staffordshire Bull Terrier', 'Sussex Spaniel', 'Swedish Vallhund', 'Terranova',
    'Tervueren', 'Thai Ridgeback', 'Tibetan Mastiff', 'Tibetan Spaniel', 'Tibetan Terrier',
    'Tosa Inu', 'Treeing Tennessee Brindle', 'Treeing Walker Coonhound', 'Vizsla',
    'Weimaraner', 'Welsh Corgi Cardigan', 'Welsh Corgi Pembroke', 'Welsh Springer Spaniel',
    'Welsh Terrier', 'West Highland White Terrier', 'Whippet', 'Wire Fox Terrier',
    'Xoloitzcuintli', 'Yorkshire Terrier'
  ]


  COLORS = ['bicolor', 'tricolor', 'otro color', 'negro', 'blanco', 'marrón', 'gris', 'canela', 'atigrado',
    'crema', 'dorado', 'leonado']

  CATBREEDS = ['abisinio', 'americano de pelo corto', 'angora', 'azul ruso', 'bengalí', 'bosque de noruega',
      'británico de pelo corto', 'burmés', 'chartreux', 'cornish rex', 'devon rex', 'egipcio', 'europeo', 'himalayo',
      'javanés', 'maine coon', 'mau egipcio', 'oriental', 'persa', 'ragdoll', 'siamés', 'siberiano', 'somalí', 'sphynx',
      'tonkinés', 'otros']

  validates :name, :color, :day_lost, presence: true
end
