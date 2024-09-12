class Petfound < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many_attached :photos

  BREEDS = ['Labrador Retriever','Golden Retriever','Pastor Alemán','Shih Tzu','Beagle',
    'Bulldog Francés','Rottweiler','Chihuahua', 'Schnauzer', 'Pug', 'Dóberman', 'Cocker Spaniel',
    'Boxer', 'Pitbull Terrier', 'Perro Sin Pelo', 'Otros']
  validates :breed, inclusion: { in: BREEDS }
  validates :breed, :color, :day_found, presence: true
end
