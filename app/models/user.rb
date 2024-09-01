class User < ApplicationRecord
  has_many :products

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
end
