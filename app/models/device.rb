class Device < ApplicationRecord
  belongs_to :user

  validates :mac, :presence => true, :length => { :is => 17 }
end
