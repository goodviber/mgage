class Vote < ApplicationRecord
  belongs_to :candidate
  belongs_to :campaign

  scope :valid, -> { where(validity: 'during') }
  scope :invalid, -> { where.not(validity: 'during') }
  scope :pre, -> { where(validity: 'pre') }
  scope :post, -> { where(validity: 'post') }
end
