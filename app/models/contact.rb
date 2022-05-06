class Contact < ApplicationRecord
  has_many_attached :files, dependent: :delete_all

  validates :name, presence: true, length: {minimum: 1, maximum: 256}
  validates :email, presence: true, format:{ with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, numericality: true, length: { minimum: 10, maximum: 17 }
  validates :company, presence: true
end
