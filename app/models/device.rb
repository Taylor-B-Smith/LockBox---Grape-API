class Device < ApplicationRecord
  belongs_to :user

  # Validates a mac address length of 17 characters. More validation is needed.
  validates :mac, :presence => true, :length => { :is => 17 }
end
