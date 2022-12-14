class Author < ApplicationRecord
  def name
    "#{first_name} #{last_name}"
  end

  validates :last_name, presence: true
end
