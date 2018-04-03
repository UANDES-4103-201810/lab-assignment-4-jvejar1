class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validate :has_paid_its_tickets
  def has_paid_its_tickets
    user_tickets = UserTicket.where(user_id:user_id).where(paid:false)
    if user_tickets.length>0
      errors[:base] <<"The user has not paid all of its tickets"
    end
  end
end
