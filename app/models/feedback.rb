class Feedback < ApplicationRecord

  belongs_to :booking
  validates_presence_of :content
end
