FactoryBot.define do
  factory :fx_pair do
    base { 'gbp' }
    target { 'eur' }
    rate { '1.1' }
    last_updated_at { Time.now - 5.minutes }
  end
end