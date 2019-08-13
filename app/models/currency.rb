class Currency < ApplicationRecord
  validates :iso_code, presence: true, uniqueness: true
  validates :label, presence: true

  def self.import(currencies)
    if currencies[:errors]
      return currencies
    end

    currencies.each do |key, currency|
      Currency.find_or_create_by({
                                   iso_code: key,
                                   label: currency
                                 })
    end
  end
end
