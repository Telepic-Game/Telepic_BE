require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'Relationships' do
    it { should belong_to :stack }
  end
end
