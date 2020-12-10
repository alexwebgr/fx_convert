require 'rails_helper'

RSpec.describe FxPair, type: :model do
  describe 'validations' do
    it 'is not valid without a base' do
      fx_pair = build(:fx_pair, base: nil)
      expect(fx_pair.valid?).to be_falsey
    end

    it 'is not valid without a target' do
      fx_pair = build(:fx_pair, target: nil)
      expect(fx_pair.valid?).to be_falsey
    end

    it 'is not valid without a rate' do
      fx_pair = build(:fx_pair, rate: nil)
      expect(fx_pair.valid?).to be_falsey
    end

    it 'is not valid without last_updated_at' do
      fx_pair = build(:fx_pair, last_updated_at: nil)
      expect(fx_pair.valid?).to be_falsey
    end
  end
end
