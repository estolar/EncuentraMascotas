class Petfound < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  BREEDS = [
    'Labrador Retriever', 'Golden Retriever', 'Pastor Alemán', 'Shih Tzu', 'Beagle',
    'Bulldog Inglés', 'Bulldog Francés', 'Rottweiler', 'Poodle', 'Chihuahua',
    'Dachshund', 'Boxer', 'Doberman Pinscher', 'Siberian Husky', 'Cocker Spaniel',
    'Pomerania', 'Yorkshire Terrier', 'Border Collie', 'Akita Inu', 'Shiba Inu',
    'Samoyedo', 'Corgi', 'Pitbull Terrier', 'Staffordshire Bull Terrier',
    'Boston Terrier', 'Cavalier King Charles Spaniel', 'Mastín Napolitano',
    'Mastín Español', 'Gran Danés', 'San Bernardo', 'Terranova', 'Bichón Frisé',
    'Maltés', 'Galgo Español', 'Greyhound', 'Dálmata', 'Airedale Terrier',
    'Fox Terrier', 'West Highland White Terrier', 'Setter Irlandés', 'Setter Inglés',
    'Pointer Inglés', 'Jack Russell Terrier', 'Bull Terrier', 'Shar Pei', 'Chow Chow',
    'Basenji', 'Lhasa Apso', 'Pug', 'Vizsla', 'Weimaraner', 'Basset Hound',
    'Bloodhound', 'Cane Corso', 'Presa Canario', 'Alaskan Malamute', 'Husky de Alaska',
    'Pastor Belga Malinois', 'Komondor', 'Kuvasz', 'Schipperke', 'Whippet', 'Saluki',
    'Afghan Hound', 'Irish Wolfhound', 'Scottish Terrier', 'Cairn Terrier',
    'Norfolk Terrier', 'Norwich Terrier', 'Skye Terrier', 'Sealyham Terrier',
    'Bullmastiff', 'Rhodesian Ridgeback', 'Spanish Water Dog', 'Portuguese Water Dog',
    'Lagotto Romagnolo', 'Perro de Montaña de los Pirineos', 'Perro de Agua Americano',
    'Perro de Agua Español', 'Perro Lobo Checoslovaco', 'Perro Lobo de Saarloos',
    'Briard', 'Beauceron', 'Pastor de Shetland', 'Pastor Australiano', 'Kelpie Australiano',
    'Dogo Argentino', 'Dogo de Burdeos', 'Leonberger', 'Fila Brasileño',
    'Pastor Caucásico', 'Pastor del Cáucaso', 'Pastor de Asia Central', 'Tosa Inu',
    'American Staffordshire Terrier', 'Perro Crestado Chino', 'Spitz Alemán',
    'Tervueren', 'Groenendael', 'Bergamasco', 'Perro Lobo Italiano', 'Kangal',
    'Chin Japonés', 'Hokkaido', 'Kai', 'Kishu', 'Shikoku', 'Thai Ridgeback',
    'Azawakh', 'Boerboel', 'Pharaoh Hound', 'Podenco Ibicenco', 'Podenco Canario',
    'Coton de Tulear', 'Barbet', 'Borzoi', 'Clumber Spaniel', 'Sussex Spaniel',
    'Field Spaniel', 'Welsh Springer Spaniel', 'Irish Water Spaniel', 'English Coonhound',
    'Bluetick Coonhound', 'Treeing Walker Coonhound', 'American Foxhound',
    'English Foxhound', 'Harrier', 'Petit Basset Griffon Vendéen', 'Grand Basset Griffon Vendéen',
    'Otterhound', 'Plott', 'Redbone Coonhound', 'Portuguese Podengo', 'Portuguese Podengo Pequeno',
    'Schipperke', 'Lowchen', 'Miniature Pinscher', 'Manchester Terrier', 'English Toy Terrier',
    'Australian Terrier', 'Silky Terrier', 'Australian Silky Terrier', 'Bedlington Terrier',
    'Border Terrier', 'Dandie Dinmont Terrier', 'Glen of Imaal Terrier', 'Irish Terrier',
    'Kerry Blue Terrier', 'Lakeland Terrier', 'Welsh Terrier', 'Wire Fox Terrier',
    'Smooth Fox Terrier', 'Russell Terrier', 'Parson Russell Terrier', 'Affenpinscher',
    'Brussels Griffon', 'Cavalier King Charles Spaniel', 'Papillon', 'Phalène',
    'English Toy Spaniel', 'Japanese Chin', 'Pekingese', 'Tibetan Spaniel',
    'Tibetan Terrier', 'Löwchen', 'Bolognese', 'Havanese', 'Italian Greyhound',
    'Chinese Crested', 'Xoloitzcuintli', 'Peruvian Inca Orchid', 'Swedish Vallhund',
    'Norwegian Lundehund', 'Finnish Lapphund', 'Icelandic Sheepdog', 'Entlebucher Mountain Dog',
    'Appenzeller Sennenhund', 'Greater Swiss Mountain Dog', 'Bernese Mountain Dog',
    'Finnish Spitz', 'Norwegian Elkhound', 'Swedish Elkhound', 'Keeshond', 'Eurasier',
    'American Eskimo Dog', 'Samoyed', 'Shikoku', 'Akita Americano', 'Central Asian Shepherd Dog',
    'Carpathian Shepherd Dog', 'Caucasian Shepherd Dog', 'Maremma Sheepdog', 'Estrela Mountain Dog',
    'Spanish Mastiff', 'Tibetan Mastiff', 'Anatolian Shepherd Dog', 'Komondor', 'Kuvasz',
    'Pyrenean Mastiff', 'Bulldog Americano', 'Bulldog Campeiro', 'Catahoula Leopard Dog',
    'Chinook', 'Redbone Coonhound', 'Treeing Tennessee Brindle', 'Boykin Spaniel',
    'Nova Scotia Duck Tolling Retriever', 'American Water Spaniel', 'Chesapeake Bay Retriever',
    'Curly-Coated Retriever', 'Flat-Coated Retriever', 'Irish Setter', 'Gordon Setter',
    'English Setter', 'Welsh Corgi Pembroke', 'Welsh Corgi Cardigan', 'Perro Sin Pelo', 'Otros'
  ]

  COLORS = ['bicolor', 'tricolor', 'otro color', 'negro', 'blanco', 'marrón', 'gris', 'canela', 'atigrado',
    'crema', 'dorado', 'leonado']

  validates :breed, inclusion: { in: BREEDS }
  validates :breed, :color, :day_found, presence: true

end
