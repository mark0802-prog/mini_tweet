class Tweet < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  belongs_to :user

  validates :message, presence: true
end
