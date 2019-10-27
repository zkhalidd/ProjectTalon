class Booking < ApplicationRecord

  belongs_to :customer
  belongs_to :service

  has_one :feedback, required: false

  validates_presence_of :booking_date, :booking_time

  def self.slots
    ['3:30 pm – 5:30 pm', '5:30 pm – 7:30 pm', '7:30 pm – 9:30 pm']
  end

  def date_and_time
    "#{booking_date.strftime('%d-%m-%Y')} #{booking_time}"
  end
end
