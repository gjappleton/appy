class Restaurant < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }

  belongs_to :owner
end
