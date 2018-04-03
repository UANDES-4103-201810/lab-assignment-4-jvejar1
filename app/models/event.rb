class Event < ApplicationRecord
  belongs_to :place
  has_many :tickets
  validate :valid_start_date
  validate :place_and_start_date
  def valid_start_date
    if start_date < Time.now.to_date or start_date.nil?
      errors.add(:start_date, "start date must be greater than this date")
    end
  end
  def place_and_start_date
    events_same_hour_place = Event.where(place_id:place_id).where(start_date:start_date)

    if events_same_hour_place.length>0
      errors[:base] <<"There are another event in same place at same hour"
    end

  end
end

