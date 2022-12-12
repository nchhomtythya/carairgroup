require 'json'

class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :model, :make, :year, :category, :description, :price, :availability, :address, :transmission, :colour, presence: true

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def description_as_array
    JSON.parse(description)
  end
end
