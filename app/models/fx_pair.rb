class FxPair < ApplicationRecord
  validates :base, presence: true
  validates :target, presence: true
  validates :rate, presence: true
  validates :last_updated_at, presence: true
end
