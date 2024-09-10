class Address < ApplicationRecord
  belongs_to :petfound
  belongs_to :petlost
end
