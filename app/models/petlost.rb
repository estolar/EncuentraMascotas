class Petlost < ApplicationRecord
  belongs_to :user
  BREEDS = ['Labrador Retriever','Golden Retriever','Pastor Alemán','Shih Tzu','Beagle',
    'Bulldog Francés','Rottweiler','Chihuahua', 'Schnauzer', 'Pug', 'Dóberman', 'Cocker Spaniel',
    'Boxer', 'Pitbull Terrier', 'Perro Sin Pelo', 'Otros']
  validates :breeds, inclusion: { in: BREEDS }
  validates :name, :breed, :color, :day_lost, presence: true

end
