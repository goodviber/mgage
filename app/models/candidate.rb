class Candidate < ApplicationRecord
  has_many :votes
  belongs_to :campaign

  validates_presence_of :name
end
