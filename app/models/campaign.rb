class Campaign < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :candidates, dependent: :destroy
end
