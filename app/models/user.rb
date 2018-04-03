
class EmailValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
			record.errors[attribute] << (options[:message] || "is not an email")
		end
	end
end

class User < ApplicationRecord
	has_many :user_tickets
	has_many :tickets, :through => :user_tickets
	validates :email, presence: true, email: true
	validates :phone, length: { in: 9..12 }
	validates :password, length: { in: 8..12 }
end

