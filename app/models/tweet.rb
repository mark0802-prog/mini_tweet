class Tweet < ApplicationRecord
  validates :message, presence: true
end
