class Petlost < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  BREEDS = ['Labrador Retriever','Golden Retriever','Pastor Alemán','Shih Tzu','Beagle',
    'Bulldog Francés','Rottweiler','Chihuahua', 'Schnauzer', 'Pug', 'Dóberman', 'Cocker Spaniel',
    'Boxer', 'Pitbull Terrier', 'Perro Sin Pelo', 'Otros']
  validates :breed, inclusion: { in: BREEDS }
  validates :name, :breed, :color, :day_lost, presence: true

end
