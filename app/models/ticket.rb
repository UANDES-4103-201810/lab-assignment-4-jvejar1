class Ticket < ApplicationRecord
  belongs_to :event
  has_many :user_tickets
  has_many :users, through: :user_tickets
  validates :price, numericality: {greater_than: 0 }
  validate :valid_ticket_creation_date
  def valid_ticket_creation_date
    self_event = self.event
    if self_event ==nil
      errors[:event_id]<<"The event must exist"
    else self_event.start_date<Time.now.to_date
      errors[:base]<<"The ticket cannot be created after its events has started"
    end
  end
end
