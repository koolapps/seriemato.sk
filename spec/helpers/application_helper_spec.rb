require 'spec_helper'

describe ApplicationHelper do
  describe '#years_of_birt' do
    it 'returns array of years since this year - 15 to this year - 70' do
      years_of_birth = ApplicationHelper::years_of_birth
      expect(years_of_birth[0]).to be(Time.now.year - 15)
      expect(years_of_birth[-1]).to be(Time.now.year - 70)
    end
  end
end
