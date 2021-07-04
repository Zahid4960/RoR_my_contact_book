class ContactBook < ApplicationRecord
  self.table_name = "contact_books"

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :dop, presence: true
  validates :contact_no, presence: true

end
