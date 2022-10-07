class Car < ApplicationRecord
	 has_many :likes, as: :likeable
	 has_many_attached :images
	 has_many :reviews
 	 accepts_nested_attributes_for :reviews
   	 belongs_to :user
   	 has_many :ratings
end
